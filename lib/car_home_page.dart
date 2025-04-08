// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kangaroo_customer_app/auth_controller.dart';
// import 'routes.dart';
// import 'car_card.dart';
// import 'location_card.dart';

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
//         title: const Text('Kangaroo Cars'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.account_circle),
//             onPressed: () {
//               final authController = Get.find<AuthController>();
//               if (authController.isLoggedIn.value) {
//                 Get.toNamed(Routes.home);
//               } else {
//                 Get.toNamed(Routes.signin);
//               }
//             },
//           ),
//         ],
//       ),
//       body: _buildBody(),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.map),
//             label: 'Map',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }

//   Widget _buildBody() {
//     return _selectedIndex == 0 ? _buildHomeScreen() : _buildMapScreen();
//   }

//   Widget _buildHomeScreen() {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'NEAREST CAR',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           CarCard(
//             carName: 'Fortuner GR',
//             distance: '9700m',
//             status: 'SQL',
//             price: '\$450.00m',
//             driverName: 'Jane Cooper',
//             driverEarnings: '\$4,253',
//             onTap: () => Get.toNamed(Routes.carSelection),
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.0),
//             child: Divider(),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               'More Cars',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SimpleCarCard(
//             carName: 'Corolla Cross',
//             distance: '44m',
//             status: 'SQL',
//             onTap: () => Get.toNamed(Routes.carSelection),
//           ),
//           SimpleCarCard(
//             carName: 'Ionic 5',
//             distance: '81m',
//             status: '80%',
//             onTap: () => Get.toNamed(Routes.carSelection),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildMapScreen() {
//     return Column(
//       children: [
//         const SizedBox(height: 16),
//         const Text(
//           'Where to?',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text(
//             'Nearby locations',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         LocationCard(
//           name: 'Times Square',
//           address: 'Broadway 10012, New York',
//           onTap: () => Get.toNamed(Routes.map),
//         ),
//         LocationCard(
//           name: 'Park Avenue',
//           address: 'Park Ave, New York',
//           onTap: () => Get.toNamed(Routes.map),
//         ),
//         LocationCard(
//           name: '5th Avenue',
//           address: '5th Ave, New York',
//           onTap: () => Get.toNamed(Routes.map),
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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/auth_controller.dart';
import 'routes.dart';
import 'car_card.dart';
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
        leading: Icon(Icons.menu, color: Colors.black),
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
      bottomNavigationBar: BottomNavigationBar(
  backgroundColor: Colors.amber,       items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.car_rental), label: 'Car '),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search car '),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody() {
    return _selectedIndex <= 0 ? _buildHomeScreen() :(_selectedIndex<=1? _buildMapScreen() : ( _selectedIndex==2? _buildCarScreen(): _buildSearchScreen()));
  }

  Widget _buildHomeScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'NEAREST CAR',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          CarCard(
            carName: 'Fortuner GR',
            distance: '4km',
            status: 'SQL',
            price: '\$45.00/h',
            driverName: 'Jane Cooper',
            driverEarnings: '\$4,253',
            onTap: () => Get.toNamed(Routes.carSelection),
          ),
          const Divider(),
          const Text(
            'More Cars',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          CarCard(
            carName: 'Corolla Cross',
            distance: '44m',
            status: 'SQL',
            price: '\$30.00/h',
            driverName: 'John Doe',
            driverEarnings: '\$3,125',
            onTap: () => Get.toNamed(Routes.carSelection),
          ),
          CarCard(
            carName: 'Ionic 5',
            distance: '81m',
            status: '80%',
            price: '\$50.00/h',
            driverName: 'Alice Smith',
            driverEarnings: '\$5,000',
            onTap: () => Get.toNamed(Routes.carSelection),
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
          name: 'Times Square',
          address: 'Broadway 10012, New York',
          onTap: () => Get.toNamed(Routes.map),
        ),
        LocationCard(
          name: 'Park Avenue',
          address: 'Park Ave, New York',
          onTap: () => Get.toNamed(Routes.map),
        ),
        LocationCard(
          name: '5th Avenue',
          address: '5th Ave, New York',
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
              children: const [
                CarListItem(
                  carName: 'Audi R8',
                  price: '\$1120 / day',
                  timeAway: '21 min away',
                ),
                CarListItem(
                  carName: 'Mercedes',
                  price: '\$2,254 / day',
                  timeAway: '21 min away',
                ),
                CarListItem(
                  carName: 'Audi S5',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                ),
                CarListItem(
                  carName: 'Alfa Romeo F4',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                ),
                CarListItem(
                  carName: 'Limousine',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                ),
                CarListItem(
                  carName: 'Bently',
                  price: '\$2,810 / day',
                  timeAway: '21 min away',
                ),
                CarListItem(
                  carName: '2 min away',
                  price: '',
                  timeAway: '',
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

  const CarListItem({
    super.key,
    required this.carName,
    required this.price,
    required this.timeAway,
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

// ----------

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



// //---------------
// // class MapScreen extends StatefulWidget {
// //   const MapScreen({super.key});

// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   static const CameraPosition _initialCameraPosition = CameraPosition(
// //     target: LatLng(40.7128, -74.0060),
// //     zoom: 12,
// //   );

// //   final Set<Marker> _markers = {
// //     Marker(
// //       markerId: MarkerId('timesSquare'),
// //       position: LatLng(40.7580, -73.9855),
// //       infoWindow: const InfoWindow(title: 'Times Square'),
// //     ),
// //     Marker(
// //       markerId: MarkerId('parkAvenue'),
// //       position: LatLng(40.7614, -73.9776),
// //       infoWindow: const InfoWindow(title: 'Park Avenue'),
// //     ),
// //     Marker(
// //       markerId: MarkerId('fifthAvenue'),
// //       position: LatLng(40.7750, -73.9655),
// //       infoWindow: const InfoWindow(title: '5th Avenue'),
// //     ),
// //   };

// //   late GoogleMapController _mapController;

// //   void _onMapCreated(GoogleMapController controller) {
// //     _mapController = controller;
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         Expanded(
// //           child: GoogleMap(
// //             initialCameraPosition: _initialCameraPosition,
// //             markers: _markers,
// //             onMapCreated: _onMapCreated,
// //             myLocationEnabled: true,
// //             myLocationButtonEnabled: true,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }






// // class MapScreen extends StatefulWidget {
// //   const MapScreen({super.key});
  
// //   @override
// //   State<MapScreen> createState() => _MapScreenState();
// // }

// // class _MapScreenState extends State<MapScreen> {
// //   // Initial camera position for New York City.
// //   static const CameraPosition _initialCameraPosition = CameraPosition(
// //     target: LatLng(40.7128, -74.0060),
// //     zoom: 12,
// //   );

// //   final Set<Marker> _markers = {
// //     Marker(
// //       markerId: MarkerId('timesSquare'),
// //       position: LatLng(40.7580, -73.9855),
// //       infoWindow: const InfoWindow(title: 'Times Square'),
// //     ),
// //     Marker(
// //       markerId: MarkerId('parkAvenue'),
// //       position: LatLng(40.7614, -73.9776),
// //       infoWindow: const InfoWindow(title: 'Park Avenue'),
// //     ),
// //     Marker(
// //       markerId: MarkerId('fifthAvenue'),
// //       position: LatLng(40.7750, -73.9655),
// //       infoWindow: const InfoWindow(title: '5th Avenue'),
// //     ),
// //   };

// //   late GoogleMapController _mapController;

// //   void _onMapCreated(GoogleMapController controller) {
// //     _mapController = controller;
// //   }
  
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           // Dynamic Google Map
// //           GoogleMap(
// //             initialCameraPosition: _initialCameraPosition,
// //             markers: _markers,
// //             onMapCreated: _onMapCreated,
// //             myLocationEnabled: true,
// //             myLocationButtonEnabled: true,
// //           ),

// //           // Menu Button
// //           Positioned(
// //             top: 50,
// //             left: 20,
// //             child: Material(
// //               elevation: 4,
// //               shape: const CircleBorder(),
// //               color: Colors.white,
// //               child: IconButton(
// //                 icon: const Icon(Icons.menu, color: Colors.black),
// //                 onPressed: () {
// //                   // Add menu functionality if needed
// //                 },
// //               ),
// //             ),
// //           ),

// //           // Bottom Panel with Search and Nearby Locations
// //           Align(
// //             alignment: Alignment.bottomCenter,
// //             child: Container(
// //               decoration: const BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black26,
// //                     blurRadius: 10,
// //                     offset: Offset(0, -5),
// //                   ),
// //                 ],
// //               ),
// //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   // Drag Handle
// //                   Container(
// //                     width: 40,
// //                     height: 4,
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey[400],
// //                       borderRadius: BorderRadius.circular(4),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),

// //                   // Search Bar
// //                   Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                     decoration: BoxDecoration(
// //                       color: Colors.grey[100],
// //                       borderRadius: BorderRadius.circular(30),
// //                     ),
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.search, color: Colors.grey),
// //                         const SizedBox(width: 8),
// //                         const Expanded(
// //                           child: Text(
// //                             'Where to?',
// //                             style: TextStyle(fontSize: 16),
// //                           ),
// //                         ),
// //                         // ClipOval(
// //                         //   child: Image.network(
// //                         //     'https://storage.googleapis.com/a1aa/image/TDHTYnXayCIm_3ssh98iec3cSY2agCCW6rDp5aSCwHM.jpg',
// //                         //     width: 36,
// //                         //     height: 36,
// //                         //     fit: BoxFit.cover,
// //                         //   ),
// //                         // ),
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 24),

// //                   // Nearby Locations Header
// //                   const Align(
// //                     alignment: Alignment.centerLeft,
// //                     child: Text(
// //                       'Nearby locations',
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                   const SizedBox(height: 16),

// //                   // List of Nearby Locations
// //                   const LocationItem(
// //                     // imageUrl: 'https://storage.googleapis.com/a1aa/image/oog43_ZhrGyWybupCnw4Rg-drSnaJcExmM3w8HWfAh0.jpg',
// //                     title: 'Times Square',
// //                     subtitle: 'Broadway 10012, New York',
// //                     time: '16 min away',
// //                   ),
// //                   const LocationItem(
// //                     // imageUrl: 'https://storage.googleapis.com/a1aa/image/kaY0VYKPZdw95gxa4qWofuU5i4vE5Goo98_GC6PrXCw.jpg',
// //                     title: 'Park Avenue',
// //                     subtitle: 'Park Ave, New York',
// //                     time: '18 min away',
// //                   ),
// //                   const LocationItem(
// //                     // imageUrl: 'https://storage.googleapis.com/a1aa/image/zejc0UiguKMvou5XxIrverA5QpwN0o-U-60nESXtmUc.jpg',
// //                     title: '5th Avenue',
// //                     subtitle: '5th Ave, New York',
// //                     time: '09 min away',
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class LocationItem extends StatelessWidget {
// //   // final String imageUrl;
// //   final String title;
// //   final String subtitle;
// //   final String time;

// //   const LocationItem({
// //     // required this.imageUrl,
// //     required this.title,
// //     required this.subtitle,
// //     required this.time,
// //     super.key,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         children: [
// //           // Location Image
// //           ClipRRect(
// //             borderRadius: BorderRadius.circular(8),
// //             // child: Image.network(
// //             //   imageUrl,
// //             //   width: 50,
// //             //   height: 50,
// //             //   fit: BoxFit.cover,
// //             // ),
// //           ),
// //           const SizedBox(width: 12),
// //           // Title and Subtitle
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   title,
// //                   style: const TextStyle(fontWeight: FontWeight.bold),
// //                 ),
// //                 Text(
// //                   subtitle,
// //                   style: TextStyle(color: Colors.grey[600]),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           // Time
// //           Row(
// //             children: [
// //               const Icon(Icons.access_time, size: 18, color: Colors.amber),
// //               const SizedBox(width: 4),
// //               Text(time),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }

