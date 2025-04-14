import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // You may later replace this with dynamic data for the profile
    const String userName = 'John Doe';
    const String userEmail = 'john.doe@example.com';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          // Header: Profile Section
          Container(
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            child: Row(
              children: [
                // Profile Picture (replace with your asset)
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                const SizedBox(width: 16),
                // User details: name and email
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        userEmail,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () {
                          // Navigate to profile details if needed
                        },
                        child: const Text(
                          'View profile',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Settings Options
          SettingOption(
            icon: Icons.history,
            title: 'Ride History',
            onTap: () {
              // Handle navigation to Ride History page
            },
          ),
          SettingOption(
            icon: Icons.payment,
            title: 'Payments',
            onTap: () {
              // Handle navigation to Payments page
            },
          ),
          SettingOption(
            icon: Icons.location_on,
            title: 'Saved Places',
            onTap: () {
              // Handle navigation to Saved Places page
            },
          ),
          SettingOption(
            icon: Icons.settings,
            title: 'App Settings',
            onTap: () {
              // Handle navigation to App Settings page
            },
          ),
          SettingOption(
            icon: Icons.help_outline,
            title: 'Help',
            onTap: () {
              // Handle navigation to Help page
            },
          ),
          const Divider(height: 1),
          // Optionally, add more custom options like About, Terms, etc.
          SettingOption(
            icon: Icons.info,
            title: 'About',
            onTap: () {
              // Handle navigation to About page
            },
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
