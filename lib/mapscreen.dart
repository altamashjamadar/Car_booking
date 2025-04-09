
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   static const CameraPosition _initialCameraPosition = CameraPosition(
//     target: LatLng(40.7128, -74.0060),
//     zoom: 12,
//   );

//   final Set<Marker> _markers = {
//     Marker(
//       markerId: MarkerId('timesSquare'),
//       position: LatLng(40.7580, -73.9855),
//       infoWindow: const InfoWindow(title: 'Times Square'),
//     ),
//     Marker(
//       markerId: MarkerId('parkAvenue'),
//       position: LatLng(40.7614, -73.9776),
//       infoWindow: const InfoWindow(title: 'Park Avenue'),
//     ),
//     Marker(
//       markerId: MarkerId('fifthAvenue'),
//       position: LatLng(40.7750, -73.9655),
//       infoWindow: const InfoWindow(title: '5th Avenue'),
//     ),
//   };

//   late GoogleMapController _mapController;

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: GoogleMap(
//             initialCameraPosition: _initialCameraPosition,
//             markers: _markers,
//             onMapCreated: _onMapCreated,
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//           ),
//         ),
//       ],
//     );
//   }
// }






// class MapScreen1 extends StatefulWidget {
//   const MapScreen1({super.key});
  
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }


// class LocationItem extends StatelessWidget {
//   // final String imageUrl;
//   final String title;
//   final String subtitle;
//   final String time;

//   const LocationItem({
//     // required this.imageUrl,
//     required this.title,
//     required this.subtitle,
//     required this.time,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           // Location Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             // child: Image.network(
//             //   imageUrl,
//             //   width: 50,
//             //   height: 50,
//             //   fit: BoxFit.cover,
//             // ),
//           ),
//           const SizedBox(width: 12),
//           // Title and Subtitle
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: const TextStyle(fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   subtitle,
//                   style: TextStyle(color: Colors.grey[600]),
//                 ),
//               ],
//             ),
//           ),
//           // Time
//           Row(
//             children: [
//               const Icon(Icons.access_time, size: 18, color: Colors.amber),
//               const SizedBox(width: 4),
//               Text(time),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

