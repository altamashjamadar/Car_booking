// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'routes.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kangaroo_customer_app/screen/all_cars_search.dart';

// class Confirmride extends StatefulWidget {
//   const Confirmride({super.key});

//   @override
//   State<Confirmride> createState() => _ConfirmrideState();
// }

// class _ConfirmrideState extends State<Confirmride> {
//  final Completer<GoogleMapController> _mapController = Completer();
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polylines = {};
 
//  @override
//   void initState() {
//     super.initState();
//     final currentLocation = const LatLng(18.500115, 73.949802);
//     final AmanoraMall = const LatLng(18.519280, 73.933);

//     _markers.addAll([
//       Marker(
//         markerId: const MarkerId('current_location'),
//         position: currentLocation,
//         infoWindow: const InfoWindow(title: 'Current Location'),
//       ),
//       Marker(
//         markerId: const MarkerId('amanora_mall'),
//         position: AmanoraMall,
//         infoWindow: const InfoWindow(title: 'Amanora Mall '),
//       ),
//     ]);

//     _polylines.add(
//       Polyline(
//         polylineId: const PolylineId('route'),
//         color: Colors.orange,
//         width: 5,
//         points: [currentLocation, AmanoraMall],
//       ),
//     );
//   }

 
 
 
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           GoogleMap(
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(18.500115, 73.949802),
//               zoom: 14,
//             ),
//             markers: _markers,
//             polylines: _polylines,
//             onMapCreated: (controller) => _mapController.complete(controller),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//           ),
        
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: _buildBottomPanel(context),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBottomPanel(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     return 
//     Container(
//       height: screenHeight * 0.45,
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 40,
//             height: 5,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(2.5),
//             ),
//           ),
         
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text('Confirm ride', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 ElevatedButton(onPressed: onPressed, child: child)
//             ],
//           ),
//           const SizedBox(height: 16),
          
          
//         ],
        
//       ),
      
      
//     );
// //     ElevatedButton(
// //   onPressed: () {
// //     Get.toNamed(Routes.driver);
// //   },
// //   style: ElevatedButton.styleFrom(
// //    backgroundColor: Colors.amber[200],
// //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
// //  ),
// //   child: Text(
// //    "price",
// //     // "Price: ${car.price}    Confirm Car",
// //     style: const TextStyle(
// //       fontSize: 16,
// //        color: Colors.black,
// //       fontWeight: FontWeight.bold,
// //     ),
// //   ),
// // );
//   }
// }
