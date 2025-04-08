import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'map_screen.dart';

class CarSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> cars = [
    {'name': 'Fortuner QR', 'price': '\$4,263'},
    {'name': 'Corolla Cross', 'price': '\$3,800'},
    {'name': 'Ionic 5', 'price': '\$3,500'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose Your Ride")),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          var car = cars[index];
          return ListTile(
            leading: Icon(Icons.directions_car),
            title: Text(car['name']!),
            subtitle: Text(car['price']!),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => Get.to(MapScreen()),
          );
        },
      ),
    );
  }
}