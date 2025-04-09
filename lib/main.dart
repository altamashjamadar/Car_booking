import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/auth_controller.dart';
import 'package:kangaroo_customer_app/car_home_page.dart';
// import 'package:kangaroo_customer_app/car_selection_screen.dart';
import 'package:kangaroo_customer_app/forgot_password_screen.dart';
import 'package:kangaroo_customer_app/map_controller.dart';
import 'package:kangaroo_customer_app/password_reset_success_screen.dart';
import 'package:kangaroo_customer_app/routes.dart';
import '../splashscreen.dart';
import '/welcome_screen.dart';
// import '/car_booking_screen.dart';
import '/sign_in_page.dart';
import '/sign_up.dart';
import '/otp_screen.dart';
import '/map_screen.dart';
// import '/home_screen.dart';


void main() {
  Get.put(AuthController());
  Get.lazyPut(() => MapController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kangaroo Customer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      // initialRoute: '/map',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/signin', page: () =>  SignInPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/otp', page: () => OTPScreen(phone: Get.arguments)),
        GetPage(name: '/home', page: () => CarHomePage()),
        // GetPage(name: '/booking', page: () => CarBookingScreen()),
        GetPage(name: '/forgot-password', page: () => ForgotPasswordScreen()),
         GetPage(name: '/map', page: () => MapScreen()), 
          GetPage(
  name: Routes.passwordResetSuccess,
  page: () =>  PasswordResetSuccessScreen(),
),
         GetPage(name: Routes.map,page: () => MapScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut<MapController>(() => MapController());
  }),
),
        // GetPage(name: '/carHome', page: () => CarHomePage(),),
      ],
    );
  }
}





// --------
// Correct paris mapp-
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Dynamic Map UI',
//       debugShowCheckedModeBanner: false,
//       home: const MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});
  
//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   // Initial camera position for New York City.
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
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Dynamic Google Map
//           GoogleMap(
//             initialCameraPosition: _initialCameraPosition,
//             markers: _markers,
//             onMapCreated: _onMapCreated,
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//           ),

//           // Menu Button
//           Positioned(
//             top: 50,
//             left: 20,
//             child: Material(
//               elevation: 4,
//               shape: const CircleBorder(),
//               color: Colors.white,
//               child: IconButton(
//                 icon: const Icon(Icons.menu, color: Colors.black),
//                 onPressed: () {
//                   // Add menu functionality if needed
//                 },
//               ),
//             ),
//           ),

//           // Bottom Panel with Search and Nearby Locations
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     offset: Offset(0, -5),
//                   ),
//                 ],
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Drag Handle
//                   Container(
//                     width: 40,
//                     height: 4,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[400],
//                       borderRadius: BorderRadius.circular(4),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Search Bar
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     decoration: BoxDecoration(
//                       color: Colors.grey[100],
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.search, color: Colors.grey),
//                         const SizedBox(width: 8),
//                         const Expanded(
//                           child: Text(
//                             'Where to?',
//                             style: TextStyle(fontSize: 16),
//                           ),
//                         ),
//                         // ClipOval(
//                         //   child: Image.network(
//                         //     'https://storage.googleapis.com/a1aa/image/TDHTYnXayCIm_3ssh98iec3cSY2agCCW6rDp5aSCwHM.jpg',
//                         //     width: 36,
//                         //     height: 36,
//                         //     fit: BoxFit.cover,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Nearby Locations Header
//                   const Align(
//                     alignment: Alignment.centerLeft,
//                     child: Text(
//                       'Nearby locations',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // List of Nearby Locations
//                   const LocationItem(
//                     // imageUrl: 'https://storage.googleapis.com/a1aa/image/oog43_ZhrGyWybupCnw4Rg-drSnaJcExmM3w8HWfAh0.jpg',
//                     title: 'Times Square',
//                     subtitle: 'Broadway 10012, New York',
//                     time: '16 min away',
//                   ),
//                   const LocationItem(
//                     // imageUrl: 'https://storage.googleapis.com/a1aa/image/kaY0VYKPZdw95gxa4qWofuU5i4vE5Goo98_GC6PrXCw.jpg',
//                     title: 'Park Avenue',
//                     subtitle: 'Park Ave, New York',
//                     time: '18 min away',
//                   ),
//                   const LocationItem(
//                     // imageUrl: 'https://storage.googleapis.com/a1aa/image/zejc0UiguKMvou5XxIrverA5QpwN0o-U-60nESXtmUc.jpg',
//                     title: '5th Avenue',
//                     subtitle: '5th Ave, New York',
//                     time: '09 min away',
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
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

// paris map




// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'car_selection_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Kangaroo Customer App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CarSelectionScreen(),
//     );
//   }
// }