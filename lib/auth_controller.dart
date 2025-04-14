
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kangaroo_customer_app/password_reset_success_screen.dart';


// class AuthController extends GetxController {
  
//   final nameController = TextEditingController();
//   final phoneController = TextEditingController();
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final otpController = TextEditingController();


//   var isLoading = false.obs;
//   var otpSent = false.obs;
//   var showPassword = false.obs;

//   bool validateSignUpForm() {
//     return nameController.text.isNotEmpty &&
//         phoneController.text.isNotEmpty &&
//         GetUtils.isEmail(emailController.text.trim()) &&
//         passwordController.text.length >= 8;
//   }


//   bool isValidPhoneNumber(String phone) {
//     return GetUtils.isPhoneNumber(phone) || GetUtils.isNumericOnly(phone);
//   }

//   bool validateOTP() {
//     return otpController.text.length == 4 && GetUtils.isNumericOnly(otpController.text);
//   }

//   Future<void> sendOTP() async {
//     if (!isValidPhoneNumber(phoneController.text)) {
//       Get.snackbar('Error', 'Please enter a valid phone number');
//       return;
//     }

//     isLoading(true);
//     await Future.delayed(const Duration(seconds: 2)); 
//     otpSent(true);
//     isLoading(false);
//     Get.snackbar('Success', 'OTP sent to ${phoneController.text}');
//   }


//   Future<void> verifyOTP() async {
//     if (!validateOTP()) {
//       Get.snackbar('Error', 'Please enter a valid 4-digit OTP');
//       return;
//     }

//     isLoading(true);
//     await Future.delayed(const Duration(seconds: 1)); 
    
//     if (otpController.text == '4526') { 
//       isLoading(false);
//       Get.offAllNamed('/home');
//       Get.snackbar('Success', 'Account created successfully!');
//     } else {
//       isLoading(false);
//       Get.snackbar('Error', 'Invalid OTP. Please try again.');
//     }
//   }

//   // Add this method to your AuthController class
// Future<void> resetPassword() async {
//   if (!GetUtils.isEmail(emailController.text.trim())) {
//     Get.snackbar('Error', 'Please enter a valid email');
//     return;
//   }

//   isLoading(true);
//   try {
//     // Here you would typically call your API for password reset
//     await Future.delayed(Duration(seconds: 2)); // Simulate network call
    
//     Get.snackbar(
//       'Success',
//       'Password reset link sent to ${emailController.text}',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//     // In auth_controller.dart
//     Get.offAll(() => PasswordResetSuccessScreen());
//     // Instead of Get.back();
//     // Get.back(); 
//     //// Return to previous screen
//   } catch (e) {
//     Get.snackbar('Error', 'Failed to send reset link: $e');
//   } finally {
//     isLoading(false);
//   }
// }

//   @override
//   void onClose() {
//     nameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     otpController.dispose();
//     super.onClose();
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kangaroo_customer_app/routes.dart';

// class AuthController extends GetxController {
//   // TextEditingControllers
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController otpController = TextEditingController();

//   // Observable variables
//   var isLoading = false.obs;
//   var otpSent = false.obs;
//   var showPassword = false.obs;
//   var isLoggedIn = false.obs;

//   // Form validators
//   bool validateSignUpForm() {
//     return nameController.text.isNotEmpty &&
//         phoneController.text.isNotEmpty &&
//         GetUtils.isEmail(emailController.text.trim()) &&
//         passwordController.text.length >= 8;
//   }

//   bool validateSignInForm() {
//     return GetUtils.isEmail(emailController.text.trim()) &&
//         passwordController.text.isNotEmpty && passwordController.text.length>=8;
//   }

//   bool isValidPhoneNumber(String phone) {
//     return GetUtils.isPhoneNumber(phone) || GetUtils.isNumericOnly(phone);
//   }

//   bool validateOTP() {
//     return otpController.text.length == 4 && GetUtils.isNumericOnly(otpController.text);
//   }

//   // Authentication methods
//   Future<void> signIn() async {
//     if (!validateSignInForm()) {
//       Get.snackbar('Error', 'Please enter valid email and password');
//       return;
//     }

//     isLoading(true);
//     try {
//       // Simulate network call
//       await Future.delayed(const Duration(seconds: 2));
      
//       isLoggedIn(true);
//            Get.offAllNamed('/car-home');
//         // Get.offAllNamed(Routes.carHome);
//       Get.snackbar('Success', 'Logged in successfully');
//     } catch (e) {
//       Get.snackbar('Error', 'Login failed: $e');
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> signUp() async {
//     if (!validateSignUpForm()) {
//       Get.snackbar('Error', 'Please fill all fields correctly');
//       return;
//     }

//     isLoading(true);
//     try {
//       await sendOTP();
//       if (otpSent.value) {
//         Get.toNamed('/otp', arguments: phoneController.text);
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Signup failed: $e');
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<void> sendOTP() async {
//     if (!isValidPhoneNumber(phoneController.text)) {
//       Get.snackbar('Error', 'Please enter a valid phone number');
//       return;
//     }

//     isLoading(true);
//     await Future.delayed(const Duration(seconds: 2)); // Simulate network call
//     otpSent(true);
//     isLoading(false);
//     Get.snackbar('Success', 'OTP sent to ${phoneController.text}');
//   }

//   // Future<void> verifyOTP() async {
//   //   if (!validateOTP()) {
//   //     Get.snackbar('Error', 'Please enter a valid 4-digit OTP');
//   //     return;
//   //   }

//   //   isLoading(true);
//   //   try {
//   //     await Future.delayed(const Duration(seconds: 2)); // Simulate verification
      
//   //     if (otpController.text == '4526') { // Test OTP
//   //       isLoggedIn(true);
//   //       Get.offAllNamed('/car-home');
//   //       Get.snackbar('Success', 'Account created successfully!');
//   //     } else {
//   //       Get.snackbar('Error', 'Invalid OTP. Please try again.');
//   //     }
//   //   } catch (e) {
//   //     Get.snackbar('Error', 'Verification failed: $e');
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }

//   //  Future<void> verifyOTP() async {
//   // try {
//   //   if (!validateOTP()) {
//   //     Get.snackbar('Error', 'Please enter a valid 4-digit OTP');
//   //     return;
//   //   }

//   //   isLoading(true);
    
//   //   // Simulate verification delay
//   //   await Future.delayed(const Duration(seconds: 1));
    
//   //   if (otpController.text == '4526') { // Test OTP
//   //     isLoggedIn(true);
//   //     Get.offAllNamed(Routes.carHome);
//   //     Get.snackbar('Success', 'Account verified successfully!');
//   //   } else {
//   //     Get.snackbar('Error', 'Invalid OTP. Please try again.');
//   //   }
//   // } catch (e) {
//   //   Get.snackbar('Error', 'Verification failed: ${e.toString()}');
//   // } finally {
//   //   isLoading(false);
//   // }
//   //    }


//   Future<void> verifyOTP() async {
//   try {
//     // First validate the OTP format
//     if (otpController.text.isEmpty) {
//       Get.snackbar('Error', 'Please enter the OTP');
//       return;
//     }
    
//     if (!GetUtils.isNumericOnly(otpController.text)){
//       Get.snackbar('Error', 'OTP should contain only numbers');
//       return;
//     }
    
//     if (otpController.text.length != 4) {
//       Get.snackbar('Error', 'OTP should be 4 digits');
//       return;
//     }

//     isLoading(true);
    
//     // Simulate network call
//     await Future.delayed(const Duration(seconds: 1));

//     if (otpController.text == '4526') { // Test OTP
//       isLoggedIn(true);
//       // Clear the OTP controller after successful verification
//       otpController.clear();
//       Get.offAllNamed(Routes.carHome);
//       Get.snackbar('Success', 'OTP verified successfully!');
//     } else {
//       Get.snackbar('Error', 'Invalid OTP. Please try again.');
//     }
//   } catch (e, stackTrace) {
//     debugPrint('OTP Verification Error: $e');
//     debugPrint(stackTrace.toString());
//     Get.snackbar('Error', 'Verification failed. Please try again.');
//   } finally {
//     isLoading(false);
//   }
// }

//   Future<void> resetPassword() async {
//     if (!GetUtils.isEmail(emailController.text.trim())) {
//       Get.snackbar('Error', 'Please enter a valid email');
//       return;
//     }

//     isLoading(true);
//     try {
//       await Future.delayed(const Duration(seconds: 2)); // Simulate network call
//       Get.snackbar(
//         'Success', 
//         'Password reset link sent to ${emailController.text}',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//       // Get.back();
//       // 
//           Get.offAllNamed(Routes.passwordResetSuccess);

//     } catch (e) {
//       Get.snackbar('Error', 'Failed to send reset link: $e');
//     } finally {
//       isLoading(false);
//     }
//   }

//   void logout() {
//     nameController.clear();
//     phoneController.clear();
//     emailController.clear();
//     passwordController.clear();
//     otpController.clear();
//     isLoggedIn(false);
//     otpSent(false);
//     Get.offAllNamed('/signin');
//   }

//   void togglePasswordVisibility() {
//     showPassword(!showPassword.value);
//   }

//   @override
//   void onClose() {
//     nameController.dispose();
//     phoneController.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//     otpController.dispose();
//     super.onClose();
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/password_reset_success_screen.dart';

class AuthController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final otpController = TextEditingController();

  // Add isLoggedIn as an observable field.
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
      // Set isLoggedIn to true once OTP is successfully verified.
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
      // Here you would typically call your API for password reset
      await Future.delayed(const Duration(seconds: 2)); // Simulate network call
      
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
