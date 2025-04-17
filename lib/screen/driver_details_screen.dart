import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/screen/all_cars_search.dart';
import 'package:kangaroo_customer_app/screen/routes.dart';

class DriverDetailsScreen extends StatefulWidget {
  const DriverDetailsScreen({super.key});

  @override
  State<DriverDetailsScreen> createState() => _DriverDetailsScreenState();
}

class _DriverDetailsScreenState extends State<DriverDetailsScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();

    final currentLocation = const LatLng(18.5204, 73.8567);
    final destination = const LatLng(18.5018, 73.8636);

    _markers.addAll([
      Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
      Marker(
        markerId: const MarkerId('destination'),
        position: destination,
        infoWindow: const InfoWindow(title: 'Swargate'),
      ),
    ]);

    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.orange,
        width: 5,
        points: [currentLocation, destination],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(18.5204, 73.8567),
              zoom: 14,
            ),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (controller) => _mapController.complete(controller),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
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
      height: screenHeight * 0.60,
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
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'We Find You a Driver',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Driver will pick you in 2:30',
                style: TextStyle(fontSize: 22, color: Colors.amber),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                shape: const CircleBorder(),
                clipBehavior: Clip.antiAlias,
                child: ClipOval(
                  child: Image.asset(
                    "assets/user_image.jpeg",
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          Row(children: [const SizedBox(width: 12)]),
           Text(
              "Mike Marco",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "mike@example.in",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "987xxxxxxx8",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),

            // const Spacer(),
        
        
          const SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: () {
              Get.toNamed(Routes.driver);
            },
            style: ElevatedButton.styleFrom(
               backgroundColor: Colors.amber[200],
              // foregroundColor: Colors.black87,
              // backgroundColor: Colors.amber[200],
              // padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(12),
              // ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            icon: const Icon(Icons.call,color: Colors.black,),
            label: const Text("Call Driver",style: TextStyle(color: Colors.black,),),
            
          ),
        ],
      ),
    );
  }
}
