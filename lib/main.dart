import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/all_cars_search.dart';
import 'package:kangaroo_customer_app/auth_controller.dart';
import 'package:kangaroo_customer_app/car_booking_screen.dart';
import 'package:kangaroo_customer_app/car_home_page.dart';
import 'package:kangaroo_customer_app/car_selection_screen.dart';
// import 'package:kangaroo_customer_app/car_selection_screen.dart';
import 'package:kangaroo_customer_app/forgot_password_screen.dart';
import 'package:kangaroo_customer_app/location_screen.dart';
import 'package:kangaroo_customer_app/map_controller.dart';
import 'package:kangaroo_customer_app/password_reset_success_screen.dart';
import 'package:kangaroo_customer_app/paymentScreen.dart';
import 'package:kangaroo_customer_app/rideScreen.dart';
import 'package:kangaroo_customer_app/routes.dart';
import 'package:kangaroo_customer_app/savedPlacesScreen.dart';
import 'package:kangaroo_customer_app/settingScreen.dart';
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
      // initialRoute: '/car-selection',
      // initialRoute: '/all-car-selection',
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
         GetPage(name: '/your-route', page: () => YourRouteScreen()), 
         GetPage(name: '/car-selection', page: () => CarSelectionScreen()),
         GetPage(name: '/SettingsScreen', page: () => SettingsScreen()),
         GetPage(name: '/ride', page: () => YourRidesScreen()),
         GetPage(name: '/savedPlaces', page: () => SavedPlacesScreen()),
           GetPage(name: '/Payment', page: () => PaymentMethodsScreen()),
           GetPage(name: '/Booking', page: () => CarBookingScreen()),
          GetPage(name: '/passwordReset',page: () =>  PasswordResetSuccessScreen(),),
         GetPage(name: Routes.map,page: () => MapScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut<MapController>(() => MapController());
  }),
),
        // GetPage(name: '/carHome', page: () => CarHomePage(),),
        GetPage(name: '/all-car-selection', page: () => AllCarsSearch()), 
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


///all cars search
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kangaroo_customer_app/all_cars_search.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Car Selection Example',
//       debugShowCheckedModeBanner: false,
//       home: const AllCarsSearch(),
//     );
//   }
// }

// class CarSelectionScreen extends StatefulWidget {
//   const CarSelectionScreen({Key? key}) : super(key: key);

//   @override
//   _CarSelectionScreenState createState() => _CarSelectionScreenState();
// }

// class _CarSelectionScreenState extends State<CarSelectionScreen> {
//   final Completer<GoogleMapController> _mapController = Completer();
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     // Define locations:
//     final currentLocation = const LatLng(18.5204, 73.8567);
//     final swargateBusStand = const LatLng(18.5018, 73.8636);

//     // Add markers:
//     _markers.addAll([
//       Marker(
//         markerId: const MarkerId('current_location'),
//         position: currentLocation,
//         infoWindow: const InfoWindow(title: 'Current Location'),
//       ),
//       Marker(
//         markerId: const MarkerId('swargate_bus_stand'),
//         position: swargateBusStand,
//         infoWindow: const InfoWindow(title: 'Swargate Bus Stand'),
//       ),
//     ]);

//     // Add polyline:
//     _polylines.add(
//       Polyline(
//         polylineId: const PolylineId('route'),
//         color: Colors.orange,
//         width: 5,
//         points: [currentLocation, swargateBusStand],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // You can wrap the body with SafeArea if needed.
//       body: Stack(
//         children: [
//           // Google Map as background:
//           GoogleMap(
//             initialCameraPosition: const CameraPosition(
//               target: LatLng(18.5204, 73.8567),
//               zoom: 14,
//             ),
//             markers: _markers,
//             polylines: _polylines,
//             onMapCreated: (controller) => _mapController.complete(controller),
//             myLocationEnabled: true,
//             myLocationButtonEnabled: true,
//           ),
//           // Top container showing current selected location.
//           Positioned(
//             top: 16,
//             left: 16,
//             right: 16,
//             child: SafeArea(
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(24),
//                   boxShadow: const [
//                     BoxShadow(color: Colors.black12, blurRadius: 8),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Icon(Icons.location_on, color: Colors.blue),
//                     const SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         'Swargate Bus Stand',
//                         textAlign: TextAlign.center,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const Icon(Icons.keyboard_arrow_down),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Bottom panel with search field, car list, and "View all".
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

//     return Container(
//       height: screenHeight * 0.40,
//       // margin: const EdgeInsets.only(bottom: 16), // space at the bottom
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(24.0),
//           topRight: Radius.circular(24.0),
//         ),
//       ),
//       child: Column(
//         children: [
//           // Drag handle indicator
//           Container(
//             width: 40,
//             height: 5,
//             margin: const EdgeInsets.symmetric(vertical: 8),
//             decoration: BoxDecoration(
//               color: Colors.grey[300],
//               borderRadius: BorderRadius.circular(2.5),
//             ),
//           ),
//           // Search field
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Search car',
//               prefixIcon: const Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Header row for the car list
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text(
//                 'Pick a car',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           // Horizontal list of car items
//           SizedBox(
//             height: 140, // fixed height for the list
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               children: [
//                 CarListItem(
//                   carName: 'Audi R8',
//                   price: '\$1,120/day',
//                   // timeAway: '1 min away',
//                   imagePath: 'assets/cars/audi R8.jpeg',
//                 ),
//                 CarListItem(
//                   carName: 'Mercedes',
//                   price: '\$2,254/day',
//                   // timeAway: '2 min away',
//                   imagePath: 'assets/cars/Mercedes.jpeg',
//                 ),
//                 CarListItem(
//                   carName: 'Audi S5',
//                   price: '\$2,810/day',
//                   // timeAway: '5 min away',
//                   imagePath: 'assets/cars/Audi_S5.jpeg',
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//           // "View all" text
//           InkWell(
//             // Navigator.push(context, MaterialPageRoute(builder: (context) => const YourRouteScreen()),
                      
// // );
//             onTap: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllCarsSearch(),));
//             },
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Text(
//                   'View all',
//                   style: TextStyle(color: Colors.blue),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8),
//         ],
//       ),
//     );
//   }
// }

// class CarListItem extends StatelessWidget {
//   final String carName;
//   final String price;
//   // final String timeAway;
//   final String imagePath;

//   const CarListItem({
//     Key? key,
//     required this.carName,
//     required this.price,
//     // required this.timeAway,
//     required this.imagePath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//         color: Colors.white, // white card
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12.withOpacity(0.05),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           // Car image section
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
//             child: Image.asset(
//               imagePath,
//               height: 80,
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(height: 8),
//           // Car details section
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: Column(
//               children: [
//                 Text(
//                   carName,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   price,
//                   style: const TextStyle(
//                     color: Colors.black54,
//                     fontSize: 13,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 // const SizedBox(height: 4),
//                 // Text(
//                 //   timeAway,
//                 //   style: const TextStyle(
//                 //     color: Colors.grey,
//                 //     fontSize: 12,
//                 //   ),
//                 //   textAlign: TextAlign.center,
//                 // ),
//                 // const SizedBox(height: 8),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
