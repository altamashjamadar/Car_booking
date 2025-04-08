
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/sign_in_page.dart';
import '../auth_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Get.to(SignInPage());
              authController.nameController.clear();
              authController.phoneController.clear();
              authController.emailController.clear();
              authController.passwordController.clear();
              authController.otpController.clear();
              Get.offAllNamed('/signin');
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${authController.nameController.text}!',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Phone: ${authController.phoneController.text}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Email: ${authController.emailController.text}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}