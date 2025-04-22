import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/sign_in_page.dart';
import 'package:kangaroo_customer_app/sign_up.dart';

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
          const Divider(height: 1),
        
          SettingOption(
            icon: Icons.settings,
            title: 'App Settings',
            onTap: () {
            //  Get.dialog(
            //   // AlertDialog(
            //   //   backgroundColor: Colors.white,
            //   // ),
            //   BottomSheet(onClosing: () {
                
            //   }, builder: (context) {
                
            //   },)
            //  );
               Get.to(() => const AppSettingsPage());
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

class AppSettingsPage extends StatefulWidget {
  const AppSettingsPage({Key? key}) : super(key: key);

  @override
  State<AppSettingsPage> createState() => _AppSettingsPageState();
}

class _AppSettingsPageState extends State<AppSettingsPage> {
  bool _darkMode = false;
  bool _notifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('App Settings'),
      
        elevation: 1,
        centerTitle: true,
      ),
      body: 
      Container(
        
        child: ListView(
          children: [
            SwitchListTile(
              title: const Text('Dark Mode'),
              value: _darkMode,
              onChanged: (v) => setState(() => _darkMode = v),
              secondary: const Icon(Icons.dark_mode),
            ),
        
            SwitchListTile(
              title: const Text('Push Notifications'),
              value: _notifications,
              onChanged: (v) => setState(() => _notifications = v),
              secondary: const Icon(Icons.notifications_active),
            ),
        
            const Divider(height: 1),
            ListTile(
              
              leading: const Icon(Icons.delete_forever, color: Colors.redAccent),
              title: const Text('Delete Account'),
              subtitle: const Text(
                'Permanently remove your account and data',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              onTap: () {
                Get.dialog<bool>(
                  AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text('Delete Account?'),
                    content: const Text(
                      'This will permanently remove your account and all of your data. '
                      'Are you sure you want to continue?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Get.back(result: false),
                        child: const Text('Cancel'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                        ),
                        onPressed: () {
                          Get.back(result: true);
                          
                          Get.offAll(SignInPage());
                        },
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                  barrierDismissible: false,
                ).then((confirmed) {
                  if (confirmed == true) {
                  
                    Get.snackbar(
                      'Account Deleted',
                      'Your account has been removed.',
                      backgroundColor: Colors.redAccent.withOpacity(0.1),
                      colorText: Colors.redAccent,
                    );
                   
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
