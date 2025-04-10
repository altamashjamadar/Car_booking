
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/all_cars_search.dart';

class SelectedCar extends StatefulWidget {
  const SelectedCar({Key? key}) : super(key: key);

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
    // final currentLocation = const LatLng(40.785091, -73.968285);
    final currentLocation = const LatLng(18.5204, 73.8567);
    final SwargateBusStand = const LatLng(18.5018, 73.8636);

    _markers.addAll([
      Marker(
        markerId: const MarkerId('current_location'),
        position: currentLocation,
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
      Marker(
        markerId: const MarkerId('Shaniwar wada'),
        position: SwargateBusStand,
        infoWindow: const InfoWindow(title: 'Swargate '),
      ),
    ]);

    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        color: Colors.orange,
        width: 5,
        points: [currentLocation, SwargateBusStand],
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
          // Top container to show selected location.
          // Positioned(
          //   top: 16,
          //   left: 20,
          //   right: 20,
          //   child: Container(
          //     padding: const EdgeInsets.all(12.0),
          //     decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(24.0),
          //       boxShadow: const [
          //         BoxShadow(color: Colors.black12, blurRadius: 8.0),
          //       ],
          //     ),
          //     child: Row(
          //       children: [
          //         const Icon(Icons.location_on, color: Colors.blue),
          //         const SizedBox(width: 8),
          //         Expanded(
          //           child: Text(
          //             'SwarGate Bus Stand',
          //             style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //           ),
          //         ),
          //         const Icon(Icons.keyboard_arrow_down),
          //       ],
          //     ),
          //   ),
          // ),
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
    return 
    Container(
      height: screenHeight * 0.45,
      //  margin: const EdgeInsets.only(bottom: 16),
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
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
          const SizedBox(height: 16),
          // Header row for the car list
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Pick a car', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              // Text('View all', style: TextStyle(color: Colors.blue)),
            ],
          ),
          const SizedBox(height: 8),
          // List of cars (horizontal scroll)
          Expanded(
            child: ListView(
              // scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              children:  [
                CarListItem(carName: 'Audi R8', price: '\$1,120/day', timeAway: '1 min away',imagePath: 'assets/cars/audi R8.jpeg'),
                // CarListItem(carName: 'Mercedes', price: '\$2,254/day', timeAway: '2 min away',imagePath: 'assets/cars/Mercedes.jpeg'),
                // CarListItem(carName: 'Audi S5', price: '\$2,810/day', timeAway: '5 min away',imagePath: 'assets/cars/Audi_S5.jpeg'),
                // CarListItem(carName: 'Alfa Romeo F4', price: '\$2,810/day', timeAway: '5 min away',imagePath: 'assets/cars/Alfa_Romeo_F4.jpeg'),
                // CarListItem(carName: 'Limousine', price: '\$2,810/day', timeAway: '10 min away',imagePath: 'assets/cars/Limousine.jpeg'),
                // CarListItem(carName: 'Bentley', price: '\$2,810/day', timeAway: '12 min away',imagePath: 'assets/cars/Bentley.jpeg'),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          // InkWell(

          //    onTap: (){
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=> const AllCarsSearch(),));
          //   },
            // child: 
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: const [
            //     // Text('See all', style: TextStyle(fontSize: 18)),
            //     Text('View all', style: TextStyle(color: Colors.blue)),
            //   ],
            // ),
          // ),
                    const SizedBox(height: 16), 
        ],
      ),
    );
  }
}

class CarListItem extends StatelessWidget {
  final String carName;
  final String price;
  final String timeAway;
  final String imagePath;

  const CarListItem({
    Key? key,
    required this.carName,
    required this.price,
    required this.timeAway,
     required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 120,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Image.asset(imagePath, height: 60, fit: BoxFit.contain),
            Text(carName, style: const TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text(price, textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Text(timeAway, textAlign: TextAlign.center),

          ],
        ),
      ),
    );
  }
}



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kangaroo_customer_app/all_cars_search.dart';

