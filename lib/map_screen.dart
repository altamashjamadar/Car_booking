
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/CustomDrawer.dart';
import 'package:kangaroo_customer_app/location_screen.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _mapController;
  final Location _location = Location();
  LatLng _currentPosition = const LatLng(18.5204, 73.8567);
  final Set<Marker> _markers = {};
  bool _isLoading = true;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _initializeMap();
  }

  Future<void> _initializeMap() async {
    try {
      bool serviceEnabled = await _location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await _location.requestService();
        if (!serviceEnabled) throw Exception('Location services are disabled');
      }

      PermissionStatus permission = await _location.hasPermission();
      if (permission == PermissionStatus.denied) {
        permission = await _location.requestPermission();
        if (permission != PermissionStatus.granted) {
          throw Exception('Location permissions denied');
        }
      }

      final currentLocation = await _location.getLocation();
      setState(() {
        _currentPosition = LatLng(
          currentLocation.latitude ?? 18.5204,
          currentLocation.longitude ?? 73.8567,
        );
        _markers.add(
          Marker(
            markerId: const MarkerId("currentLocation"),
            position: _currentPosition,
            infoWindow: const InfoWindow(title: "You are here"),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        );
        _isLoading = false;
      });

      _timer = Timer.periodic(const Duration(seconds: 10), (_) => _addNearbyLocations());

      _addNearbyLocations();
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addNearbyLocations() {
    final Random random = Random();
    final List<Marker> nearby = List.generate(10, (index) {
      final double offsetLat = (random.nextDouble() - 0.8) / 1000;
      final double offsetLng = (random.nextDouble() - 0.1) / 1000;
      final LatLng newPosition = LatLng(
        _currentPosition.latitude + offsetLat,
        _currentPosition.longitude + offsetLng,
      );
      return Marker(
        markerId: MarkerId('nearby_$index'),
        position: newPosition,
        infoWindow: InfoWindow(title: 'Nearby Car #$index'),
        icon: BitmapDescriptor.defaultMarker,
      );
    });

    setState(() {
      _markers.removeWhere((m) => m.markerId.value.startsWith('nearby_'));
      _markers.addAll(nearby);
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
 GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _currentPosition,
                zoom: 15,
              ),
              markers: _markers,
              onMapCreated: (controller) {
                _mapController = controller;
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
            ),
            
          
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
          
                  Container(
                    width: 40,
                    
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 16),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const YourRouteScreen()),
                      
);
                    },
                    child: Container(
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
                  ),
                  const SizedBox(height: 24),

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

          
                  LocationItem(
                    title: 'Alacritys',
                    subtitle: 'lane no 5',
                    time: '09 min away',
                  ),
                  LocationItem(
                    title: 'Gangotri Park',
                    subtitle: 'Dr. Babasaheb Ambedkar Rd',
                    time: '20 min away',
                  ),
                  LocationItem(
                    title: 'Pune SEO Company',
                    subtitle: 'Amar Srushti Rd',
                    time: '29 min away',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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