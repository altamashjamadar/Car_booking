import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CancelRide extends StatefulWidget {
  const CancelRide({super.key});

  @override
  State<CancelRide> createState() => _CancelRideState();
}

class _CancelRideState extends State<CancelRide> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    final currentLocation = const LatLng(18.500115, 73.949802);
    final destination = const LatLng(18.519280, 73.933000);

    _markers.addAll([
      Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(
        markerId: const MarkerId('destination'),
        position: destination,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    ]);

    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.orange,
        width: 4,
        points: [currentLocation, destination],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: LatLng(18.500115, 73.949802),
              zoom: 14,
            ),
            markers: _markers,
            polylines: _polylines,
            onMapCreated: (controller) => _mapController.complete(controller),
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomSheet(context, height * 0.35),
          ),
        ],
      ),

    );
  }

  Widget _buildBottomSheet(BuildContext context, double sheetHeight) {
    return Container(
      height: sheetHeight,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your ride',
                // textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.access_time, size: 16, color: Colors.orange),
                    SizedBox(width: 4),
                    Text('at location', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/cars/audi R8.jpeg',
                  width: 60,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Audi R8 (MH 0000)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
                ),
                
              ),
              
          ],
          ),
          Divider(),
          //  const Spacer(),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Get.toNamed(Routes.cancelRide);
              },
              style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.amber,
                
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              // icon: const Icon(Icons.call,color: Colors.black,),
              label: const Text("Confrim Ride",style: TextStyle(color: Colors.black,),),
              
            ),
            
          ),
          Column(
            children: [
              Text("Cancel",
              style: TextStyle(
                color: Colors.red
              ),)
            ],
          )

   
      ],
      ),
    );
  }
}