import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:kangaroo_customer_app/screen/car_home_page.dart';
import 'package:kangaroo_customer_app/screen/feedback.dart';
import 'package:kangaroo_customer_app/screen/rating_screen.dart';

class InprogressRideScreen extends StatefulWidget {
  const InprogressRideScreen({super.key});

  

  @override
  State<InprogressRideScreen> createState() => _InprogressRideScreenState();
}

class _InprogressRideScreenState extends State<InprogressRideScreen> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  
  @override
    void initState() {
    super.initState();
 
    Future.delayed(const Duration(seconds: 2), () {
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      final currentLocation = const LatLng(18.500115, 73.949802);
    final destination = const LatLng(18.51927, 73.933000);

    _markers.addAll([
      Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
      Marker(markerId: const MarkerId('destination'), position: destination),
    ]);

    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.orange,
        width: 4,
        points: [currentLocation, destination],
      ),
    );
      Get.to(() => const RatingScreen());
    });
  });
    }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
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
            child: _buildBottomSheet(context, size * 0.55),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Driver on the way',
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
                    Text('2 min', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '115m away',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'MH 12 AZ 0000',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Mike Marco',
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),

                SizedBox(width: 90),
                InkWell(
                  onTap: () {
                    Get.to(RatingScreen());
            
                  },
                  child: Card(
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
                ),
              ],
            ),
          ),
          SizedBox(height: 4),
          Container(
            child: Row(
              children: [
                Material(
                  color: Colors.white,
                  shape: const CircleBorder(),
                  elevation: 2,
                  child: IconButton(
                    icon: const Icon(Icons.phone),
                    onPressed: () => print('Call driver'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    elevation: 2,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () => print('Message driver'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.message, size: 20),
                            SizedBox(width: 8),
                            Text(
                              'Message Mike',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Pickup From',
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '41th Street, 9th Ave, NY',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => print('Trip Details'),
                child: const Text(
                  'Trip Details',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 20),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  {
                    Get.snackbar('Cancelled', 'Ride Cancelled successfully!');
                    Get.to(CarHomePage());
                  }
                },
                child: Text("Cancel", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
