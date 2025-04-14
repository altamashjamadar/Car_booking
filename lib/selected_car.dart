
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kangaroo_customer_app/all_cars_search.dart';

// class SelectedCar extends StatefulWidget {
//   const SelectedCar({Key? key}) : super(key: key);

//   @override
//   _SelectedCarState createState() => _SelectedCarState();
// }

// class _SelectedCarState extends State<SelectedCar> {
//   final Completer<GoogleMapController> _mapController = Completer();
//   final Set<Marker> _markers = {};
//   final Set<Polyline> _polylines = {};

//   @override
//   void initState() {
//     super.initState();
//     // final currentLocation = const LatLng(40.785091, -73.968285);
//     final currentLocation = const LatLng(18.5204, 73.8567);
//     final SwargateBusStand = const LatLng(18.5018, 73.8636);

//     _markers.addAll([
//       Marker(
//         markerId: const MarkerId('current_location'),
//         position: currentLocation,
//         infoWindow: const InfoWindow(title: 'Current Location'),
//       ),
//       Marker(
//         markerId: const MarkerId('Shaniwar wada'),
//         position: SwargateBusStand,
//         infoWindow: const InfoWindow(title: 'Swargate '),
//       ),
//     ]);

//     _polylines.add(
//       Polyline(
//         polylineId: const PolylineId('route'),
//         color: Colors.orange,
//         width: 5,
//         points: [currentLocation, SwargateBusStand],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Google Map
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
//       //  margin: const EdgeInsets.only(bottom: 16),
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
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Header row for the car list
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: const [
//               Text('Pick a car', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            
//             ],
//           ),
//           const SizedBox(height: 8),
//           // List of cars (horizontal scroll)
//           Expanded(
//             child: ListView(
//               // scrollDirection: Axis.horizontal,
//               physics: const BouncingScrollPhysics(),
//               children:  [
//                 CarListItem(carName: 'Audi R8', price: '\$1,120/day', timeAway: '1 min away',imagePath: 'assets/cars/audi R8.jpeg'),
//                 // CarListItem(carName: 'Mercedes', price: '\$2,254/day', timeAway: '2 min away',imagePath: 'assets/cars/Mercedes.jpeg'),
//                 // CarListItem(carName: 'Audi S5', price: '\$2,810/day', timeAway: '5 min away',imagePath: 'assets/cars/Audi_S5.jpeg'),
//                 // CarListItem(carName: 'Alfa Romeo F4', price: '\$2,810/day', timeAway: '5 min away',imagePath: 'assets/cars/Alfa_Romeo_F4.jpeg'),
//                 // CarListItem(carName: 'Limousine', price: '\$2,810/day', timeAway: '10 min away',imagePath: 'assets/cars/Limousine.jpeg'),
//                 // CarListItem(carName: 'Bentley', price: '\$2,810/day', timeAway: '12 min away',imagePath: 'assets/cars/Bentley.jpeg'),
//               ],
//             ),
//           ),
//           const SizedBox(height: 8,),
          
//                     const SizedBox(height: 16), 
//         ],
//       ),
//     );
//   }
// }

// class CarListItem extends StatelessWidget {
//   final String carName;
//   final String price;
//   final String timeAway;
//   final String imagePath;

//   const CarListItem({
//     Key? key,
//     required this.carName,
//     required this.price,
//     required this.timeAway,
//      required this.imagePath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       width: 120,
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//              Image.asset(imagePath, height: 60, fit: BoxFit.contain),
//             Text(carName, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
//             const SizedBox(height: 4),
//             Text(price, textAlign: TextAlign.center),
//             const SizedBox(height: 4),
//             Text(timeAway, textAlign: TextAlign.center),

//           ],
//         ),
//       ),
//     );
//   }
// }





// SelectedCar.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/all_cars_search.dart';
import 'package:kangaroo_customer_app/routes.dart';

class SelectedCar extends StatefulWidget {
  final Car selectedCar;
  const SelectedCar({Key? key, required this.selectedCar}) : super(key: key);

  @override
  _SelectedCarState createState() => _SelectedCarState();
}

class _SelectedCarState extends State<SelectedCar> {
  final Completer<GoogleMapController> _mapController = Completer();
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();

    // Sample locations – you can adjust as needed.
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
          // Google Map
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
          // Bottom panel with selected car details
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomPanel(context),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPanel(BuildContext context) {
    final Car car = widget.selectedCar;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.50,
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
          // Optional: a search field if needed
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
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Selected Car',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Display the details of the selected car
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      car.imagePath,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(car.price,
                            style:
                                TextStyle(fontSize: 14, color: Colors.grey[600])),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // You may add more widgets or controls below
          const SizedBox(height: 16),
          // For example, a button to confirm the selection:
          ElevatedButton(
            onPressed: () {
               Get.toNamed(Routes.booking);
           
              // Handle button press (e.g., proceed to booking)
            },
            child: const Text('Confirm Selection'),
          ),
        ],
      ),
    );
  }
}

