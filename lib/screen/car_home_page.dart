import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/screen/edit_profile_screen.dart';
// import 'package:kangaroo_customer_app/screen/rideScreen.dart';
// import 'package:kangaroo_customer_app/controller/auth_controller.dart';
import 'routes.dart';


class CarHomePage extends StatefulWidget {
  const CarHomePage({super.key});

  @override
  State<CarHomePage> createState() => _CarHomePageState();
}

class _CarHomePageState extends State<CarHomePage> {
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
      body: _buildHomeScreen(),

      drawer: Drawer(
        width: size.width * 0.65,
        backgroundColor: Colors.white,

        child: Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
           
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
                       InkWell(onTap: () => Get.to(EditProfileScreen()),
                        child: const Icon(Icons.arrow_forward_ios, size: 16)),
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
                leading: Icon(Icons.card_giftcard),
                title: Text('Refer and Earn'),
                onTap: () {
                  Get.toNamed(Routes.refers);
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
            
            Expanded(
               child: Column(
                children: [
           SizedBox(height: size.height*0.4,),
                  Padding(
                       padding: const EdgeInsets.all(16.0),
                        child: Text('Version 1.0', style: TextStyle(color: Colors.grey)),
                        ),
                ],
              ),
            ),
      ],
          ),
        ),
        
       
      ),
    );
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
              color: Colors.amber,
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

}
