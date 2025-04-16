import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback onTap;

  const LocationCard({
    super.key,
    required this.name,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(address),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}