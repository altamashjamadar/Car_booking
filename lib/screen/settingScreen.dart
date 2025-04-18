import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
  //  const String userName = 'John Doe';
  //   const String userEmail = 'john.doe@example.com';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          
          // Container(
          //   color: Colors.grey[200],
          //   padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
          //   child:
          //    Row(
          //     children: [
                
          //       const CircleAvatar(
          //         radius: 35,
          //         backgroundImage: AssetImage('assets/images/profile.jpg'),
          //       ),
          //       const SizedBox(width: 16),
            
          //       Expanded(
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               userName,
          //               style: const TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             const SizedBox(height: 4),
          //             Text(
          //               userEmail,
          //               style: const TextStyle(
          //                 fontSize: 14,
          //                 color: Colors.grey,
          //               ),
          //             ),
          //             const SizedBox(height: 4),
          //             GestureDetector(
                        
          //               child: const Text(
          //                 'View profile',
          //                 style: TextStyle(
          //                   fontSize: 14,
          //                   color: Colors.blue,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const Divider(height: 1),
          // Settings Options
          // SettingOption(
          //   icon: Icons.history,
          //   title: 'Ride History',
          //   onTap: () {
          //     // to Ride History page
          //   },
          // ),
          // SettingOption(
          //   icon: Icons.payment,
          //   title: 'Payments',
          //   onTap: () {
          //     //   to Payments page
          //   },
          // ),
          // SettingOption(
          //   icon: Icons.location_on,
          //   title: 'Saved Places',
          //   onTap: () {
          //     //  to Saved Places page
          //   },
          // ),
          SettingOption(
            icon: Icons.settings,
            title: 'App Settings',
            onTap: () {
              //  to App Settings page
            },
          ),
          SettingOption(
            icon: Icons.help_outline,
            title: 'Help',
            onTap: () {
              //  to Help page
            },
          ),
          const Divider(height: 1),
          // like About, Terms, etc.
          SettingOption(
            icon: Icons.info,
            title: 'About',
            onTap: () {
              //  to About page
            },
          ),
              Expanded(
               child: Column(
                children: [
           SizedBox(height: size.height*0.6,),
                  Padding(
                       padding: const EdgeInsets.all(16.0),
                        child: Text('Version 1.0', style: TextStyle(color: Colors.grey)),
                        ),
                ],
              ),
            ),
        ],
      ),
      
    );
  }
}

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingOption({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black54),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
