import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/controller/auth_controller.dart';
import 'routes.dart';
// import 'car_card.dart';
import '../model/location_model.dart';

class CarHomePage extends StatefulWidget {
  const CarHomePage({super.key});

  @override
  State<CarHomePage> createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Kangaroo Cars',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          // TextButton(
          //   onPressed: () {
          //     final authController = Get.find<AuthController>();
          //     if (authController.isLoggedIn.value) {
          //       Get.toNamed(Routes.home);
          //     } else {
          //       Get.toNamed(Routes.signin);
          //     }
          //   },
          //   // child: const Text(
          //   //   'Car Bookings',
          //   //   style: TextStyle(color: Colors.grey),
          //   // ),
          // ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Color.fromARGB(255, 242, 201, 77),
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    height: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Notifications",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Divider(),
                        ListTile(title: Text("Your booking is confirmed")),
                        ListTile(title: Text("Driver arriving in 3 minutes")),
                        ListTile(title: Text("Promo code applied")),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: _buildBody(),

      drawer: Drawer(
        width: size.width * 0.65,
        backgroundColor: Colors.white,

        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Header
            Container(
              height: size.height * 0.16,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.amber),

                child: Row(
               
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assets/user_image.jpeg"),
                      
                    ),
                    Column(
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Text(
                      'john@example.com',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                      const Text(
                          'View profile',
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.blue,
                          ),
                        ),
                    ],
                    ),
                    SizedBox(width: 10,),
                     const Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  
                ),
              ),
            ),

            ListTile(
              leading: Icon(Icons.directions_car),
              title: Text('Your Rides'),
              onTap: () {
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
                Get.offAllNamed(Routes.login);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return _selectedIndex <= 0
        ? _buildHomeScreen()
        : (_selectedIndex <= 1
            ? _buildMapScreen()
            : (_selectedIndex == 2 ? _buildCarScreen() : _buildSearchScreen()));
  }

  Widget _buildHomeScreen() {
    
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'NEAREST CAR',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),

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
                        style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),

                  Row(
                    children: [
                      Icon(Icons.near_me, size: 16),
                      SizedBox(width: 4),
                      Text('> 870m'),
                      SizedBox(width: 16),
                      Icon(Icons.local_gas_station, size: 16),
                      SizedBox(width: 4),
                      const Text('50L'),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
                        backgroundImage: AssetImage('assets/img1.jpeg'),
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
                        style: TextStyle(fontSize: 16, color: Colors.grey),
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
              color: Colors.amber[200],
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.more_vert, color: Colors.grey[700]),
                  ],
                ),
                const SizedBox(height: 12),

                InkWell(
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
          Positioned.fill(
            child: Image.network(
              'https://storage.googleapis.com/a1aa/image/6Gh-6cKkUZPW8SEf2IRwgK2yghWNcauxkS1nvF2gMMY.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Icon(Icons.menu, color: Colors.black),
            ),
          ),

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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
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
                    imageUrl:
                        'https://storage.googleapis.com/a1aa/image/oog43_ZhrGyWybupCnw4Rg-drSnaJcExmM3w8HWfAh0.jpg',
                    title: 'Times Square',
                    subtitle: 'Broadway 10012, New York',
                    time: '16 min away',
                  ),
                  const LocationItem(
                    imageUrl:
                        'https://storage.googleapis.com/a1aa/image/kaY0VYKPZdw95gxa4qWofuU5i4vE5Goo98_GC6PrXCw.jpg',
                    title: 'Park Avenue',
                    subtitle: 'Park Ave, New York',
                    time: '18 min away',
                  ),
                  const LocationItem(
                    imageUrl:
                        'https://storage.googleapis.com/a1aa/image/zejc0UiguKMvou5XxIrverA5QpwN0o-U-60nESXtmUc.jpg',
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
    );
  }

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
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: timeAway.isNotEmpty ? Text(timeAway) : null,
          trailing:
              price.isNotEmpty
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
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(subtitle, style: TextStyle(color: Colors.grey[600])),
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
