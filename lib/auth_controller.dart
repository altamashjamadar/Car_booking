


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/password_reset_success_screen.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  var isLoggedIn = false.obs;

  var isLoading = false.obs;
  var otpSent = false.obs;
  var showPassword = false.obs;

  bool validateSignUpForm() {
    return nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        GetUtils.isEmail(emailController.text.trim()) &&
        passwordController.text.length >= 8;
  }

  bool isValidPhoneNumber(String phone) {
    return GetUtils.isPhoneNumber(phone) || GetUtils.isNumericOnly(phone);
  }

  bool validateOTP() {
    return otpController.text.length == 4 && GetUtils.isNumericOnly(otpController.text);
  }

  Future<void> sendOTP() async {
    if (!isValidPhoneNumber(phoneController.text)) {
      Get.snackbar('Error', 'Please enter a valid phone number');
      return;
    }

    isLoading(true);
    await Future.delayed(const Duration(seconds: 2)); 
    otpSent(true);
    isLoading(false);
    Get.snackbar('Success', 'OTP sent to ${phoneController.text}');
  }

  Future<void> verifyOTP() async {
    if (!validateOTP()) {
      Get.snackbar('Error', 'Please enter a valid 4-digit OTP');
      return;
    }

    isLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    
    if (otpController.text == '4526') {
       isLoggedIn(true);
      isLoading(false);
      Get.offAllNamed('/home');
      Get.snackbar('Success', 'Account created successfully!');
    } else {
      isLoading(false);
      Get.snackbar('Error', 'Invalid OTP. Please try again.');
    }
  }

  Future<void> resetPassword() async {
    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar('Error', 'Please enter a valid email');
      return;
    }

    isLoading(true);
    try {
      await Future.delayed(const Duration(seconds: 2)); 
      
      Get.snackbar(
        'Success',
        'Password reset link sent to ${emailController.text}',
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offAll(() => PasswordResetSuccessScreen());
    } catch (e) {
      Get.snackbar('Error', 'Failed to send reset link: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
