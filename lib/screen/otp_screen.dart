

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/auth_controller.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  final String phone;

  OTPScreen({super.key, required this.phone});

  final AuthController authController = Get.find<AuthController>();
  final _otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('OTP Verification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          if (authController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            child: Form(
              key: _otpFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'We sent a 4-digit code to',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    phone,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    controller: authController.otpController,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: const InputDecoration(
                      labelText: 'Enter OTP',
                      prefixIcon: Icon(Icons.lock_clock),
                      counterText: '',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the OTP';
                      }
                      if (value.length != 4 || !GetUtils.isNumericOnly(value)) {
                        return 'Please enter a valid 4-digit code';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (_otpFormKey.currentState!.validate()) {
                          authController.verifyOTP();
                        }
                      },
                      child: const Text(
                        'VERIFY OTP',
                        style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        authController.sendOTP();
                      },
                      child: const Text('Resend OTP',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        'Change Phone Number',
                      style: TextStyle(
                        color: Colors.black54,
                      ),),
                    ),
                  ),
                  if (kDebugMode) ...[
                    const SizedBox(height: 20),
                    const Center(
                      child: Text(
                        'DEBUG: Valid OTP is 4526',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
