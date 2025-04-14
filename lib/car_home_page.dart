import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/auth_controller.dart';
import 'routes.dart';
// import 'car_card.dart';
import 'location_card.dart';

class CarHomePage extends StatefulWidget {
  const CarHomePage({super.key});

  @override
  State<CarHomePage> createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Kangaroo Cars',
          style: TextStyle(color: Colors.black),
        ),
        // leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          TextButton(
            onPressed: () {
              final authController = Get.find<AuthController>();
              if (authController.isLoggedIn.value) {
                Get.toNamed(Routes.home);
              } else {
                Get.toNamed(Routes.signin);
              }
            },
            child: const Text(
              'Car Bookings',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.yellow),
            onPressed: () {},
          ),
        ],
      ),
      body: _buildBody(),
  //     bottomNavigationBar: BottomNavigationBar(
  // backgroundColor: Colors.amber,       items: const [
  //         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
  //         BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
  //         BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Car '),
  //         BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search car '),
  //       ],
  //       currentIndex: _selectedIndex,
  //       onTap: _onItemTapped,
  //     ),
      drawer: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.yellow[50],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                   child: Icon(
                          Icons.person,
                          size: 36,
                          color: Colors.grey[600],
                        ),
                  //backgroundImage: AssetImage('assets/user.jpg'), // your profile image
                ),
                SizedBox(height: 10),
                Text(
                  'John Doe',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  'john@example.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),

          // Menu items
          ListTile(
            leading: Icon(Icons.directions_car),
            title: Text('Your Rides'),
            onTap: () {
              // Navigate to rides page
              Get.toNamed(Routes.rides);
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Payment Methods'),
            onTap: () {
              Get.toNamed(Routes.payment);
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Saved Places'),
            onTap: () {
              Get.toNamed(Routes.savedPlaces);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Get.toNamed(Routes.settings);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Add your logout logic
              Get.offAllNamed(Routes.login);
            },
          ),
        ],
      ),
    )
   
    );
  }

  Widget _buildBody() {
    return _selectedIndex <= 0 ? _buildHomeScreen() :(_selectedIndex<=1? _buildMapScreen() : ( _selectedIndex==2? _buildCarScreen(): _buildSearchScreen()));
  }



  Widget _buildHomeScreen() {
    // late GoogleMapController _mapController;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
   
          const Text(
            'NEAREST CAR',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),


          GestureDetector(
            onTap: () => Get.toNamed(Routes.map),
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  
                 Image.asset('assets/fortuner.jpeg'),
                  const SizedBox(height: 12),
            
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Text(
                        'Fortuner GR',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$45.00/h',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('~870m'),
                      const Text('50L'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          
          //// Driver Card - for demonstration
        //  //
        //   Row(
        //     children: [
        //       // Avatar
        //       CircleAvatar(
        //         radius: 28,
        //         // backgroundImage: NetworkImage(
        //         //   'https://storage.googleapis.com/a1aa/image/avatar_jane_cooper.png',
        //         // ),
        //       ),
        //       const SizedBox(width: 12),
        //       // Name + earnings
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: const [
        //           Text(
        //             'Jane Cooper',
        //             style: TextStyle(fontWeight: FontWeight.bold),
        //           ),
        //           SizedBox(height: 4),
        //           Text(
        //             '\$4,253 Earned',
        //             style: TextStyle(color: Colors.grey),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        //   const SizedBox(height: 16),

        //   // Map snippet
        //   // Instead of a real Google Map, we can do a smaller Container if you want
        // //   SizedBox(
        // //     height: 200,
        // //     child: ClipRRect(
        // //       borderRadius: BorderRadius.circular(16),
        // //       child: GoogleMap(
        // //         initialCameraPosition: const CameraPosition(
        // //           target: LatLng(40.7580, -73.9855), // Times Square
        // //           zoom: 14,
        // //         ),
        //         onMapCreated: (controller) => _mapController = controller,
        //   //       markers: {
        //   //         Marker(
        //   //           markerId: const MarkerId('nearestCar'),
        //   //           position: const LatLng(40.7580, -73.9855),
        //   //         ),
        //   //       },
        //   //     ),
        //   //   ),
        //   // ),

          Row(
          
            children: [
             
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                  
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage('assets/user_image.jpeg'),
                        
                      ),
                      const SizedBox(height: 16),
                    
                      const Text(
                        'Jane Cooper',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
    
                      const Text(
                        '\$4,253',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

  
              Expanded(
                child: Container(
                  height: 200, 
        
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(18.5204, 73.8567),
                        zoom: 14,
                         ),
                      // onMapCreated: (controller) => _mapController = controller,
                      
                      markers: {
                        Marker(
                          markerId: const MarkerId('nearestCar'),
                          position: const LatLng(18.5204, 73.8567),
                           onTap: () => Get.toNamed(Routes.map),                             
                        ),
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),


          Container(

      decoration: BoxDecoration(
        color: Colors.yellow[50],
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [



          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'More Cars',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            
              Icon(Icons.more_vert, color: Colors.grey[700]),
            ],
          ),
          const SizedBox(height: 12),

          InkWell(
            // onTap: () {
            //   // handle car selection
            // },
            onTap: () => Get.toNamed(Routes.map),
            child: Row(
              children: [

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
    
                      const Text(
                        'Corolla Cross',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      
                      Row(
                        children: const [
                          Icon(Icons.near_me, size: 16),
                          SizedBox(width: 4),
                          Text('> 4km'),
                          SizedBox(width: 16),
                          Icon(Icons.local_gas_station, size: 16),
                          SizedBox(width: 4),
                          Text('50L'),
                        ],
                      ),
                    ],
                  ),
                ),
             
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ],
            ),
          ),

   
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),

   
          InkWell(
            // onTap: () {
            //   // handle car selection
            // },
            onTap: () => Get.toNamed(Routes.map),
            child: Row(
              children: [
       
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      const Text(
                        'Ionic 5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                    
                      Row(
                        children: const [
                          Icon(Icons.near_me, size: 16),
                          SizedBox(width: 4),
                          Text('> 8km'),
                          SizedBox(width: 16),
                          Icon(Icons.battery_charging_full, size: 16),
                          SizedBox(width: 4),
                          Text('80%'),
                        ],
                      ),
                    ],
                  ),
                ),
        
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.arrow_forward_ios, size: 16),
                ),
              ],
            ),
          ),
        ],
      ),
          ),
      
        ],
      ),
    );
  }

  Widget _buildMapScreen() {
    return Column(
      children: [
        const SizedBox(height: 16),
        const Text(
          'Where to?',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Nearby locations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        LocationCard(
          name: 'Alacritys',
          address: 'lane no 5 10012, New York',
          onTap: () => Get.toNamed(Routes.map),
        ),
        LocationCard(
          name: 'Gangotri Park ',
          address: 'Dr. Babasaheb Ambedkar Rd',
          onTap: () => Get.toNamed(Routes.map),
        ),
        LocationCard(
          name: 'Pune SEO Company',
          address: 'Amar Srushti Rd',
          onTap: () => Get.toNamed(Routes.map),
        ),
      ],
    );
  }

  Widget _buildCarScreen() {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search car',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CarListItem(
                  carName: 'Audi R8',
                  price: '\$1120 / day',
                  timeAway: '21 min away',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
                CarListItem(
                  carName: 'Mercedes',
                  price: '\$2,254 / day',
                  timeAway: '21 min away',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
                CarListItem(
                  carName: 'Audi S5',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
                CarListItem(
                  carName: 'Alfa Romeo F4',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
                CarListItem(
                  carName: 'Limousine',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
                CarListItem(
                  carName: 'Bently',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
                CarListItem(
                  carName: '2 min away',
                  price: '',
                  timeAway: '',
                  imagePath: 'assets/cars/audi R8.jpeg',
                ),
              ],
            ),
          ),
        ],
    );
    }

    Widget _buildSearchScreen() {
    return Expanded(
      child: Column(
               children: [
            // Map Section
            Positioned.fill(
              child: Image.network(
                'https://storage.googleapis.com/a1aa/image/6Gh-6cKkUZPW8SEf2IRwgK2yghWNcauxkS1nvF2gMMY.jpg',
                fit: BoxFit.cover,
              ),
            ),
      
            // Menu Button
            Positioned(
              top: 40,
              left: 16,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: const Icon(Icons.menu, color: Colors.black),
              ),
            ),
      
            // Search and Locations Section
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Search Bar
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search, color: Colors.grey),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Where to?',
                                border: InputBorder.none,
                              ),
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
                    const SizedBox(height: 16),
      
                    // Nearby Locations Title
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
                    const SizedBox(height: 8),
      
                    // Location List
                    const LocationItem(
                      imageUrl: 'https://storage.googleapis.com/a1aa/image/oog43_ZhrGyWybupCnw4Rg-drSnaJcExmM3w8HWfAh0.jpg',
                      title: 'Times Square',
                      subtitle: 'Broadway 10012, New York',
                      time: '16 min away',
                    ),
                    const LocationItem(
                      imageUrl: 'https://storage.googleapis.com/a1aa/image/kaY0VYKPZdw95gxa4qWofuU5i4vE5Goo98_GC6PrXCw.jpg',
                      title: 'Park Avenue',
                      subtitle: 'Park Ave, New York',
                      time: '18 min away',
                    ),
                    const LocationItem(
                      imageUrl: 'https://storage.googleapis.com/a1aa/image/zejc0UiguKMvou5XxIrverA5QpwN0o-U-60nESXtmUc.jpg',
                      title: '5th Avenue',
                      subtitle: '5th Ave, New York',
                      time: '09 min away',
                    ),
                  ],
                ),
              ),
            ),
          ],
      
      ),
    );}
    

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}



class CarListItem extends StatelessWidget {
  final String carName;
  final String price;
  final String timeAway;
  final String imagePath;

  const CarListItem({
    super.key,
    required this.carName,
    required this.price,
    required this.timeAway,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            carName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: timeAway.isNotEmpty ? Text(timeAway) : null,
          trailing: price.isNotEmpty
              ? Text(
                  price,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
        ),
        const Divider(height: 1),
      ],
    );
  }
}

class LocationItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String time;

  const LocationItem({
    required this.imageUrl,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.access_time, color: Colors.yellow),
              const SizedBox(width: 4),
              Text(time),
            ],
          ),
        ],
      ),
    );
  }
}


// // ----------

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kangaroo_customer_app/auth_controller.dart';
// import 'package:kangaroo_customer_app/map_screen.dart';
// import 'routes.dart';
// import 'car_card.dart';
// import 'location_card.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class CarHomePage extends StatefulWidget {
//   const CarHomePage({super.key});

//   @override
//   State<CarHomePage> createState() => _CarHomePageState();
// }

// class _CarHomePageState extends State<CarHomePage> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           'Kangaroo Cars',
//           style: TextStyle(color: Colors.black),
//         ),
//         leading: Icon(Icons.menu, color: Colors.black),
//         actions: [
//           TextButton(
//             onPressed: () {
//               final authController = Get.find<AuthController>();
//               if (authController.isLoggedIn.value) {
//                 Get.toNamed(Routes.home);
//               } else {
//                 Get.toNamed(Routes.signin);
//               }
//             },
//             child: const Text(
//               'Car Bookings',
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.yellow),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: _buildBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.amber,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
//           BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Car'),
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search car'),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

  
//   Widget _buildBody() {
//     return _selectedIndex == 0 ? _buildHomeScreen() : (_selectedIndex == 1 ? _buildMapScreen() : (_selectedIndex == 2 ? _buildCarScreen() : _buildSearchScreen()));
//   }

  
//   Widget _buildHomeScreen() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'NEAREST CAR',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 8),
//           CarCard(
//             carName: 'Fortuner GR',
//             distance: '4km',
//             status: 'SQL',
//             price: '\$45.00/h',
//             driverName: 'Jane Cooper',
//             driverEarnings: '\$4,253',
//             onTap: () => Get.toNamed(Routes.carSelection),
//           ),
//           const Divider(),
//           const Text(
//             'More Cars',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           CarCard(
//             carName: 'Corolla Cross',
//             distance: '44m',
//             status: 'SQL',
//             price: '\$30.00/h',
//             driverName: 'John Doe',
//             driverEarnings: '\$3,125',
//             onTap: () => Get.toNamed(Routes.carSelection),
//           ),
//           CarCard(
//             carName: 'Ionic 5',
//             distance: '81m',
//             status: '80%',
//             price: '\$50.00/h',
//             driverName: 'Alice Smith',
//             driverEarnings: '\$5,000',
//             onTap: () => Get.toNamed(Routes.carSelection),
//           ),
//         ],
//       ),
//     );
//   }

  
//   Widget _buildMapScreen() {
//     return MapScreen();
//   }

  
//   Widget _buildCarScreen() {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Search car',
//               prefixIcon: const Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView(
//             children: const [
//               CarListItem(
//                 carName: 'Audi R8',
//                 price: '\$1120 / day',
//                 timeAway: '21 min away',
//               ),
//               CarListItem(
//                 carName: 'Mercedes',
//                 price: '\$2,254 / day',
//                 timeAway: '21 min away '),
//               CarListItem(
//                 carName: 'Audi S5',
//                 price: '\$2,810 / day',
//                 timeAway: '21 min away',
//               ),
//               CarListItem(
//                 carName: 'Alfa Romeo F4',
//                 price: '\$2,810 / day',
//                 timeAway: '21 min away',
//               ),
//               CarListItem(
//                 carName: 'Limousine',
//                 price: '\$2,810 / day',
//                 timeAway: '21 min away',
//               ),
//               CarListItem(
//                 carName: 'Bently',
//                 price: '\$2,810 / day',
//                 timeAway: '21 min away',
//               ),
//               CarListItem(
//                 carName: '2 min away',
//                 price: '',
//                 timeAway: '',
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

  
//   Widget _buildSearchScreen() {
//     return Column(
//       children: [
//         Positioned.fill(
//           child: Image.network(
//             'https://storage.googleapis.com/a1aa/image/6Gh-6cKkUZPW8SEf2IRwgK2yghWNcauxkS1nvF2gMMY.jpg',
//             fit: BoxFit.cover,
//           ),
//         ),
//         Positioned(
//           top: 40,
//           left: 16,
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             child: const Icon(Icons.menu, color: Colors.black),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black26,
//                   blurRadius: 10,
//                   offset: Offset(0, -5),
//                 ),
//               ],
//             ),
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       const Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Where to?',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       CircleAvatar(
//                         backgroundImage: NetworkImage(
//                           'https://storage.googleapis.com/a1aa/image/TDHTYnXayCIm_3ssh98iec3cSY2agCCW6rDp5aSCwHM.jpg',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Nearby locations',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 const LocationItem(
//                   imageUrl: 'https://storage.googleapis.com/a1aa/image/oog43_ZhrGyWybupCnw4Rg-drSnaJcExmM3w8HWfAh0.jpg',
//                   title: 'Times Square',
//                   subtitle: 'Broadway 10012, New York',
//                   time: '16 min away',
//                 ),
//                 const LocationItem(
//                   imageUrl: 'https://storage.googleapis.com/a1aa/image/kaY0VYKPZdw95gxa4qWofuU5i4vE5Goo98_GC6PrXCw.jpg',
//                   title: 'Park Avenue',
//                   subtitle: 'Park Ave, New York',
//                   time: '18 min away',
//                 ),
//                 const LocationItem(
//                   imageUrl: 'https://storage.googleapis.com/a1aa/image/zejc0UiguKMvou5XxIrverA5QpwN0o-U-60nESXtmUc.jpg',
//                   title: '5th Avenue',
//                   subtitle: '5th Ave, New York',
//                   time: '09 min away',
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

  
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }

// class CarListItem extends StatelessWidget {
//   final String carName;
//   final String price;
//   final String timeAway;

//   const CarListItem({
//     super.key,
//     required this.carName,
//     required this.price,
//     required this.timeAway,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         ListTile(
//           title: Text(
//             carName,
//             style: const TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           subtitle: timeAway.isNotEmpty ? Text(timeAway) : null,
//           trailing: price.isNotEmpty
//               ? Text(
//                   price,
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )
//               : null,
//         ),
//         const Divider(height: 1),
//       ],
//     );
//   }
// }

// class LocationItem extends StatelessWidget {
//   final String imageUrl;
//   final String title;
//   final String subtitle;
//   final String time;

//   const LocationItem({
//     required this.imageUrl,
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
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   imageUrl,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     subtitle,
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Row(
//             children: [
//               const Icon(Icons.access_time, color: Colors.yellow),
//               const SizedBox(width: 4),
//               Text(time),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// // import your custom widgets like CarCard, SimpleCarCard, etc.

// class CarHomePage extends StatefulWidget {
//   const CarHomePage({Key? key}) : super(key: key);

//   @override
//   State<CarHomePage> createState() => _CarHomePageState();
// }

// class _CarHomePageState extends State<CarHomePage> {
//   int _selectedIndex = 0;
//   late GoogleMapController _mapController;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // 1. CUSTOM APPBAR
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         // leading: const Icon(Icons.menu, color: Colors.black),
//         title: const Text(
//           'Kangaroo Cars',
//           style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         actions: [
//           // "Car Bookings" as text
//           TextButton(
//             onPressed: () {
//               // your booking logic
//             },
//             child: const Text(
//               'Car Bookings',
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),
//           // notification icon
//           IconButton(
//             icon: const Icon(Icons.notifications, color: Colors.yellow),
//             onPressed: () {
//               // handle notifications
//             },
//           ),
//         ],
//       ),

//       // 2. BODY
//       body: _buildBody(),

//       // 3. BOTTOM NAVIGATION
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.amber,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map),
//             label: 'Map',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.car_rental),
//             label: 'Car',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.search),
//             label: 'Search car',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       // drawer: ,
//     );
//   }

//   Widget _buildBody() {
//     // Show different screens or partial screens based on _selectedIndex
//     if (_selectedIndex == 0) {
//       // Home screen
//       return _buildHomeScreen();
//     } else if (_selectedIndex == 1) {
//       // Map screen
//       return _buildMapScreen();
//     } else if (_selectedIndex == 2) {
//       // Car listing or booking screen
//       return _buildCarScreen();
//     } else {
//       // Some search screen
//       return _buildSearchScreen();
//     }
//   }

//   // ---------------------------
//   // HOME SCREEN
//   // ---------------------------
//   Widget _buildHomeScreen() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // NEAREST CAR
//           const Text(
//             'NEAREST CAR',
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),

//           // Example big card for Fortuner GR
//           Container(
//             padding: const EdgeInsets.all(16),
//             margin: const EdgeInsets.only(bottom: 16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black12,
//                   blurRadius: 6,
//                   offset: Offset(0, 3),
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
                
//                Image.asset('assets/fortuner.jpeg'),
//                 const SizedBox(height: 12),
          
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Fortuner GR',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       '\$45.00/h',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.blueGrey,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//                 // Distance + fuel
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text('~870m'),
//                     const Text('50L'),
//                   ],
//                 ),
//               ],
//             ),
//           ),

          
//           //// Driver Card - for demonstration
//         //  //
//         //   Row(
//         //     children: [
//         //       // Avatar
//         //       CircleAvatar(
//         //         radius: 28,
//         //         // backgroundImage: NetworkImage(
//         //         //   'https://storage.googleapis.com/a1aa/image/avatar_jane_cooper.png',
//         //         // ),
//         //       ),
//         //       const SizedBox(width: 12),
//         //       // Name + earnings
//         //       Column(
//         //         crossAxisAlignment: CrossAxisAlignment.start,
//         //         children: const [
//         //           Text(
//         //             'Jane Cooper',
//         //             style: TextStyle(fontWeight: FontWeight.bold),
//         //           ),
//         //           SizedBox(height: 4),
//         //           Text(
//         //             '\$4,253 Earned',
//         //             style: TextStyle(color: Colors.grey),
//         //           ),
//         //         ],
//         //       ),
//         //     ],
//         //   ),
//         //   const SizedBox(height: 16),

//         //   // Map snippet
//         //   // Instead of a real Google Map, we can do a smaller Container if you want
//         //   SizedBox(
//         //     height: 200,
//         //     child: ClipRRect(
//         //       borderRadius: BorderRadius.circular(16),
//         //       child: GoogleMap(
//         //         initialCameraPosition: const CameraPosition(
//         //           target: LatLng(40.7580, -73.9855), // Times Square
//         //           zoom: 14,
//         //         ),
//         //         onMapCreated: (controller) => _mapController = controller,
//         //         markers: {
//         //           Marker(
//         //             markerId: const MarkerId('nearestCar'),
//         //             position: const LatLng(40.7580, -73.9855),
//         //           ),
//         //         },
//         //       ),
//         //     ),
//         //   ),

//           Row(
          
//             children: [
             
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.all(16),
//                   margin: const EdgeInsets.only(right: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
                  
//                       CircleAvatar(
//                         radius: 36,
//                         backgroundColor: Colors.grey[200],
                        
//                         child: Icon(
//                           Icons.person,
//                           size: 36,
//                           color: Colors.grey[600],
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       // Driver Name
//                       const Text(
//                         'Jane Cooper',
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
    
//                       const Text(
//                         '\$4,253 Earned',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

  
//               Expanded(
//                 child: Container(
//                   height: 200, 
        
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16),
//                     child: GoogleMap(
//                       initialCameraPosition: const CameraPosition(
//                         target: LatLng(40.7580, -73.9855),
//                         zoom: 14,
//                       ),
//                       onMapCreated: (controller) => _mapController = controller,
//                       markers: {
//                         Marker(
//                           markerId: const MarkerId('nearestCar'),
//                           position: const LatLng(40.7580, -73.9855),
//                         ),
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 16),


//           Container(

//       decoration: BoxDecoration(
//         color: Colors.yellow[50],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [



//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text(
//                 'More Cars',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
            
//               Icon(Icons.more_vert, color: Colors.grey[700]),
//             ],
//           ),
//           const SizedBox(height: 12),

//           InkWell(
//             onTap: () {
//               // handle car selection
//             },
//             child: Row(
//               children: [

//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
    
//                       const Text(
//                         'Corolla Cross',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
                      
//                       Row(
//                         children: const [
//                           Icon(Icons.near_me, size: 16),
//                           SizedBox(width: 4),
//                           Text('> 4km'),
//                           SizedBox(width: 16),
//                           Icon(Icons.local_gas_station, size: 16),
//                           SizedBox(width: 4),
//                           Text('50L'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
             
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.all(8),
//                   child: const Icon(Icons.arrow_forward_ios, size: 16),
//                 ),
//               ],
//             ),
//           ),

   
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 12),
//             child: Divider(height: 1),
//           ),

   
//           InkWell(
//             onTap: () {
//               // handle car selection
//             },
//             child: Row(
//               children: [
       
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
                     
//                       const Text(
//                         'Ionic 5',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                       const SizedBox(height: 4),
                    
//                       Row(
//                         children: const [
//                           Icon(Icons.near_me, size: 16),
//                           SizedBox(width: 4),
//                           Text('> 8km'),
//                           SizedBox(width: 16),
//                           Icon(Icons.battery_charging_full, size: 16),
//                           SizedBox(width: 4),
//                           Text('80%'),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
        
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     shape: BoxShape.circle,
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 6,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   padding: const EdgeInsets.all(8),
//                   child: const Icon(Icons.arrow_forward_ios, size: 16),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//           ),
      
//         ],
//       ),
//     );
//   }


//   Widget _buildMapScreen() {
//     return const Center(
//       child: Text(
//         'Full Map Screen Placeholder',
//         style: TextStyle(fontSize: 20),
//       ),
//     );
//   }

//   // ---------------------------
//   // CAR SCREEN
//   // ---------------------------
//   Widget _buildCarScreen() {
//     return Column(
//       children: [
//         // search field
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Search car',
//               prefixIcon: const Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView(
//             children: const [
//               // your CarListItem or any custom item
//               ListTile(
//                 title: Text('Audi R8'),
//                 subtitle: Text('\$1120 / day | 21 min away'),
//               ),
//               Divider(),
//               ListTile(
//                 title: Text('Mercedes'),
//                 subtitle: Text('\$2254 / day | 21 min away'),
//               ),
//               Divider(),
//               // add more
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   // ---------------------------
//   // SEARCH SCREEN
//   // ---------------------------
//   Widget _buildSearchScreen() {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Image.network(
//             'https://storage.googleapis.com/a1aa/image/6Gh-6cKkUZPW8SEf2IRwgK2yghWNcauxkS1nvF2gMMY.jpg',
//             fit: BoxFit.cover,
//           ),
//         ),
//         // A top-left menu button
//         Positioned(
//           top: 40,
//           left: 16,
//           child: CircleAvatar(
//             backgroundColor: Colors.white,
//             child: const Icon(Icons.menu, color: Colors.black),
//           ),
//         ),
//         // white bottom card w/ locations
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
//             ),
//             padding: const EdgeInsets.all(16),
//             height: MediaQuery.of(context).size.height * 0.4,
//             child: Column(
//               children: [
//                 // “Where to?” search bar
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   decoration: BoxDecoration(
//                     color: Colors.grey[200],
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.search, color: Colors.grey),
//                       const SizedBox(width: 8),
//                       const Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: 'Where to?',
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       CircleAvatar(
//                         backgroundImage: NetworkImage(
//                           'https://storage.googleapis.com/a1aa/image/TDHTYnXayCIm_3ssh98iec3cSY2agCCW6rDp5aSCwHM.jpg',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 // "Nearby locations"
//                 const Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     'Nearby locations',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 // location list
//                 Expanded(
//                   child: ListView(
//                     children: const [
//                       ListTile(
//                         leading: Icon(Icons.location_on),
//                         title: Text('Times Square'),
//                         subtitle: Text('Broadway 10012, New York'),
//                         trailing: Text('16 min away'),
//                       ),
//                       Divider(),
//                       ListTile(
//                         leading: Icon(Icons.location_on),
//                         title: Text('Park Avenue'),
//                         subtitle: Text('Park Ave, New York'),
//                         trailing: Text('18 min away'),
//                       ),
//                       Divider(),
//                       ListTile(
//                         leading: Icon(Icons.location_on),
//                         title: Text('5th Avenue'),
//                         subtitle: Text('5th Ave, New York'),
//                         trailing: Text('09 min away'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   // ---------------------------
//   // NAVIGATION HANDLER
//   // ---------------------------
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
// }
