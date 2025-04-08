// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'map_screen.dart';

// class CarSelectionScreen extends StatelessWidget {
//   final List<Map<String, String>> cars = [
//     {'name': 'Fortuner QR', 'price': '\$4,263'},
//     {'name': 'Corolla Cross', 'price': '\$3,800'},
//     {'name': 'Ionic 5', 'price': '\$3,500'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Choose Your Ride")),
//       body: ListView.builder(
//         itemCount: cars.length,
//         itemBuilder: (context, index) {
//           var car = cars[index];
//           return ListTile(
//             leading: Icon(Icons.directions_car),
//             title: Text(car['name']!),
//             subtitle: Text(car['price']!),
//             trailing: Icon(Icons.arrow_forward_ios),
//             onTap: () => Get.to(MapScreen()),
//           );
//         },
//       ),
//     );
//   }
// }


// lib/screens/car_selection_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../car_list_item1.dart';

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({Key? key}) : super(key: key);

  @override
  _CarSelectionScreenState createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();

    // Use your desired coordinates.
    // For demonstration, these coordinates are placeholders.
    // currentLocation is the starting point.
    final currentLocation = const LatLng(40.785091, -73.968285); // Central Park area
    // gangotriPark: change this coordinate to your Gangotri Park location.
    final gangotriPark = const LatLng(40.774, -73.965);

    // Add markers for the current location and Gangotri Park.
    _markers.addAll([
      Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
      Marker(
        markerId: const MarkerId('gangotri_park'),
        position: gangotriPark,
        infoWindow: const InfoWindow(title: 'Gangotri Park'),
      ),
    ]);

    // Add a simple polyline as a placeholder route.
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.orange,
        width: 5,
        points: [currentLocation, gangotriPark],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(40.785091, -73.968285), // center on currentLocation
              zoom: 14,
            ),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (controller) => _mapController.complete(controller),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          // Top container to show Gangotri Park.
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8.0,
                  ),
                ],
              ),
              child: Row(
                children: const [
                  Icon(Icons.location_on, color: Colors.red),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Gangotri Park',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          // Bottom Panel for the search field and car list.
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomPanel(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.45,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Column(
        children: [
          // Drag handle indicator
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
          // Search field
          TextField(
            decoration: InputDecoration(
              hintText: 'Search car',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Header row for the car list
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Pick a car',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'View all',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // List of cars
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                CarListItem(
                  carName: 'Audi R8',
                  price: '\$1120/day',
                  timeAway: '1 min away',
                ),
                CarListItem(
                  carName: 'Mercedes',
                  price: '\$2,254/day',
                  timeAway: '2 min away',
                ),
                CarListItem(
                  carName: 'Audi S5',
                  price: '\$2,810/day',
                  timeAway: '5 min away',
                ),
                CarListItem(
                  carName: 'Alfa Romeo F4',
                  price: '\$2,810/day',
                  timeAway: '5 min away',
                ),
                CarListItem(
                  carName: 'Limousine',
                  price: '\$2,810/day',
                  timeAway: '10 min away',
                ),
                CarListItem(
                  carName: 'Bentley',
                  price: '\$2,810/day',
                  timeAway: '12 min away',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
