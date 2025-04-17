import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/controller/auth_controller.dart';

class CarBookingScreen extends StatelessWidget {
  const CarBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Booking'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              if (Get.find<AuthController>().phoneController.text.isNotEmpty) {
                Get.toNamed('/home');
              } else {
                Get.toNamed('/signin');
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Available Premium Cars'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
       
                if (Get.find<AuthController>().phoneController.text.isEmpty) {
                  Get.snackbar('Login Required', 'Please sign in to book a car');
                  Get.toNamed('/signin');
                } else {
                
                  Get.snackbar('Success', 'Car booked successfully!');
                }
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}