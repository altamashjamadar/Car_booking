

// // import 'package:flutter/material.dart';
// // import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import 'package:location/location.dart';

// // class MapScreen extends StatefulWidget {
// //   @override
// //   _MapScreenState createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   late GoogleMapController _mapController;
// //   late Location _location;
// //   LatLng _currentPosition = LatLng(37.7749, -122.4194); 

// //   final Set<Marker> _markers = {
// //     Marker(
// //       markerId: MarkerId("car1"),
// //       position: LatLng(37.776, -122.419),
// //       infoWindow: InfoWindow(title: "Available Car"),
// //     ),
// //   };

// //   @override
// //   void initState() {
// //     super.initState();
// //     _location = Location();
// //     _getCurrentLocation();
// //   }

// //   Future<void> _getCurrentLocation() async {
// //     try {
// //       final currentLocation = await _location.getLocation();
// //       setState(() {
// //         _currentPosition = LatLng(currentLocation.latitude!, currentLocation.longitude!);
// //         _markers.add(
// //           Marker(
// //             markerId: MarkerId("currentLocation"),
// //             position: _currentPosition,
// //             infoWindow: InfoWindow(title: "Your Location"),
// //           ),
// //         );
// //       });
// //     } catch (e) {
// //       print("Could not get current location: $e");
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Map")),
// //       body: GoogleMap(
// //         initialCameraPosition: CameraPosition(
// //           target: _currentPosition,
// //           zoom: 14,
// //         ),
// //         markers: _markers,
// //         onMapCreated: (controller) {
// //           _mapController = controller;
// //         },
// //         myLocationEnabled: true, 
// //         myLocationButtonEnabled: true, 
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   late GoogleMapController _mapController;
//   final Location _location = Location();
//   LatLng _currentPosition = const LatLng(37.7749, -122.4194);
//   final Set<Marker> _markers = {};
//   bool _isLoading = true;
//   String? _error;

//   @override
//   void initState() {
//     super.initState();
//     _initializeMap();
//   }

//   Future<void> _initializeMap() async {
//     try {
//       // 1. Check location service status
//       bool serviceEnabled = await _location.serviceEnabled();
//       if (!serviceEnabled) {
//         serviceEnabled = await _location.requestService();
//         if (!serviceEnabled) {
//           throw Exception('Location services are disabled');
//         }
//       }

//       // 2. Check and request permission
//       PermissionStatus permission = await _location.hasPermission();
//       if (permission == PermissionStatus.denied) {
//         permission = await _location.requestPermission();
//         if (permission != PermissionStatus.granted) {
//           throw Exception('Location permissions denied');
//         }
//       }

//       // 3. Get current location
//       final currentLocation = await _location.getLocation();
//       setState(() {
//         _currentPosition = LatLng(
//           currentLocation.latitude ?? 37.7749,
//           currentLocation.longitude ?? -122.4194,
//         );
//         _markers.addAll({
//           Marker(
//             markerId: const MarkerId("currentLocation"),
//             position: _currentPosition,
//             infoWindow: const InfoWindow(title: "Your Location"),
//           ),
//           const Marker(
//             markerId: MarkerId("car1"),
//             position: LatLng(37.776, -122.419),
//             infoWindow: InfoWindow(title: "Available Car"),
//           ),
//         });
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _error = e.toString();
//         _isLoading = false;
//       });
//       Get.snackbar('Error', 'Failed to load map: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Map")),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _error != null
//               ? Center(child: Text(_error!))
//               : GoogleMap(
//                   initialCameraPosition: CameraPosition(
//                     target: _currentPosition,
//                     zoom: 14,
//                   ),
//                   markers: _markers,
//                   onMapCreated: (controller) {
//                     _mapController = controller;
//                   },
//                   myLocationEnabled: true,
//                   myLocationButtonEnabled: true,
//                 ),
//     );
//   }

//   @override
//   void dispose() {
//     _mapController.dispose();
//     super.dispose();
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  final Location _location = Location();
  LatLng _currentPosition = const LatLng(40.7128, -74.0060);
  final Set<Marker> _markers = {};
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      // 1. Check location service status
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) {
          throw Exception('Location services are disabled');
        }
      }

      // 2. Check and request permission
      PermissionStatus permission = await _location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission != PermissionStatus.granted) {
          throw Exception('Location permissions denied');
        }
      }

      // 3. Get current location
      final currentLocation = await _location.getLocation();
      setState(() {
        _currentPosition = LatLng(
          currentLocation.latitude ?? 40.7128,
          currentLocation.longitude ?? -74.0060,
        );
        
        // Add markers (current location and points of interest)
        _markers.addAll({
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: _currentPosition,
            infoWindow: const InfoWindow(title: "Your Location"),
          ),
          Marker(
            markerId: const MarkerId('timesSquare'),
            position: const LatLng(40.7580, -73.9855),
            infoWindow: const InfoWindow(title: 'Times Square'),
          ),
          Marker(
            markerId: const MarkerId('parkAvenue'),
            position: const LatLng(40.7614, -73.9776),
            infoWindow: const InfoWindow(title: 'Park Avenue'),
          ),
          Marker(
            markerId: const MarkerId('fifthAvenue'),
            position: const LatLng(40.7750, -73.9655),
            infoWindow: const InfoWindow(title: '5th Avenue'),
          ),
        });
        
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
      Get.snackbar('Error', 'Failed to load map: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _error != null
                  ? Center(child: Text(_error!))
                  : GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _currentPosition,
                        zoom: 14,
                      ),
                      markers: _markers,
                      onMapCreated: (controller) {
                        _mapController = controller;
                      },
                      myLocationEnabled: true,
                      myLocationButtonEnabled: true,
                    ),

          // Menu Button
          Positioned(
            top: 50,
            left: 20,
            child: Material(
              elevation: 4,
              shape: const CircleBorder(),
              color: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  // Add menu functionality if needed
                },
              ),
            ),
          ),

          // Bottom Panel with Search and Nearby Locations
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Drag Handle
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Search Bar
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: Colors.grey),
                        const SizedBox(width: 8),
                        const Expanded(
                          child: Text(
                            'Where to?',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://storage.googleapis.com/a1aa/image/TDHTYnXayCIm_3ssh98iec3cSY2agCCW6rDp5aSCwHM.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nearby Locations Header
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Nearby locations',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // List of Nearby Locations
                  LocationItem(
                    title: 'Times Square',
                    subtitle: 'Broadway 10012, New York',
                    time: '16 min away',
                  ),
                  LocationItem(
                    title: 'Park Avenue',
                    subtitle: 'Park Ave, New York',
                    time: '18 min away',
                  ),
                  LocationItem(
                    title: '5th Avenue',
                    subtitle: '5th Ave, New York',
                    time: '09 min away',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }
}

class LocationItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const LocationItem({
    required this.title,
    required this.subtitle,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          // Location Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.grey[200],
              child: const Icon(Icons.location_on, color: Colors.blue),
            ),
          ),
          const SizedBox(width: 12),
          // Title and Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          // Time
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.amber),
              const SizedBox(width: 4),
              Text(time),
            ],
          )
        ],
      ),
    );
  }
}