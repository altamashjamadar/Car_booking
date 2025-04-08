// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:kangaroo_customer_app/auth_controller.dart';
// // // import 'package:kangaroo_customer_app/car_home_page.dart';
// // // import 'package:kangaroo_customer_app/forgot_password_screen.dart';
// // // import 'package:kangaroo_customer_app/welcome_screen.dart';

// // // class SignInPage extends StatelessWidget {
// // //   final AuthController authController = Get.put(AuthController());
// // //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
// // //   // final TextEditingController _phoneController = TextEditingController();
// // //   // final TextEditingController _passwordController = TextEditingController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Sign In'),
// // //         centerTitle: true,
// // //       ),
// // //       body:  Padding(
// // //         padding: const EdgeInsets.all(20.0),
// // //         child: Obx(() {
// // //           if (authController.isLoading.value) {
// // //             return const Center(child: CircularProgressIndicator());
// // //           }
// // //        return SingleChildScrollView(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Form(
// // //             key: _formKey, 
// // //            autovalidateMode: AutovalidateMode.onUserInteraction,
// // //             child: Column(
// // //               mainAxisAlignment: MainAxisAlignment.center,
// // //               children: [
// // //                 TextFormField(
// // //                     controller: authController.phoneController,
// // //                     keyboardType: TextInputType.phone,
// // //                     decoration: InputDecoration(
// // //                       border: OutlineInputBorder(
// // //                         borderRadius: BorderRadius.circular(8.0),
// // //                       ),
// // //                       labelText: 'Phone Number',
// // //                       prefixIcon: Icon(Icons.phone),
// // //                     ),
// // //                     validator: (value) {
// // //                       if (value == null || value.isEmpty) {
// // //                         return 'Please enter your phone number';
// // //                       }
// // //                       if (!authController.isValidPhoneNumber(value)) {
// // //                         return 'Please enter a valid phone number';
// // //                       }
// // //                       return null;
// // //                     },
// // //                   ),
// // //                   const SizedBox(height: 15),
// // //                Obx(()=> TextFormField(
// // //                 controller: authController.passwordController,
// // //                     obscureText: !authController.showPassword.value,
// // //                   // controller: _passwordController,
// // //                   // obscureText: true,
// // //                   decoration: InputDecoration(
// // //                     border: OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(8.0)
// // //                     ),
// // //                     labelText: 'Password',
// // //                     hintText: 'At least 8 characters',
// // //                     prefixIcon: Icon(Icons.lock),
// // //                       suffixIcon: IconButton(
// // //                         icon: Icon(
// // //                           authController.showPassword.value
// // //                               ? Icons.visibility
// // //                               : Icons.visibility_off,
// // //                         ),
// // //                         onPressed: () {
// // //                           authController.showPassword.toggle();
// // //                         },
// // //                       ),
// // //                   ),
// // //                   validator: (value) {
// // //                     if (value == null || value.isEmpty) {
// // //                       return 'Please enter a password';
// // //                     }
// // //                     if (value.length < 8) {
// // //                       return 'Password must be at least 8 characters';
// // //                     }
// // //                     return null;
// // //                   },
// // //                )),
// // //                 const SizedBox(height: 16),
// // //                 Align(
// // //                   alignment: Alignment.centerRight,
// // //                   child: TextButton(
// // //                     onPressed: () => Get.to(() => ForgotPasswordScreen()),
// // //                     child: const Text('Forgot Password?'),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 ElevatedButton(
// // //                   onPressed: () {
// // //                     if (_formKey.currentState!.validate()) {
// // //                       // Form is valid, proceed with sign in
// // //                       // Get.to(() => CarHomePage());
// // //                       Get.to(() => WelcomeScreen());
// // //                     }
// // //                   },
// // //                   style: ElevatedButton.styleFrom(
// // //                     minimumSize: const Size(double.infinity, 50),
// // //                     backgroundColor: Colors.black,
// // //                   ),
// // //                   child: const Text(
// // //                     'Sign In',
// // //                     style: TextStyle(
// // //                       fontSize: 18,
// // //                       color: Colors.white,
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 const SizedBox(height: 24),
// // //                 Row(
// // //                   children: [
// // //                     const Expanded(child: Divider(thickness: 1)),
// // //                     const Padding(
// // //                       padding: EdgeInsets.symmetric(horizontal: 8.0),
// // //                       child: Text('Or sign in with'),
// // //                     ),
// // //                     const Expanded(child: Divider(thickness: 1)),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 16),
// // //                 TextButton(
// // //                   onPressed: () {
// // //                     Get.toNamed('/signup');
// // //                   },
// // //                   child: const Text("Don't have an account? Sign Up"),
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ),
// // //         );
// // //         }
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:kangaroo_customer_app/auth_controller.dart';
// // import 'package:kangaroo_customer_app/car_home_page.dart';
// // import 'package:kangaroo_customer_app/forgot_password_screen.dart';
// // import 'package:kangaroo_customer_app/welcome_screen.dart';

// // // class SignInPage extends StatelessWidget {
// // //   final AuthController authController = Get.put(AuthController());
// // //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// // //   SignInPage({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       // Dark background
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         title: const Text('Sign In Page'),
// // //         centerTitle: true,
// // //         elevation: 0,
// // //       ),
// // //       body: Obx(() {
// // //         // Show loading indicator if needed
// // //         if (authController.isLoading.value) {
// // //           return const Center(child: CircularProgressIndicator());
// // //         }
// // //         // Main content
// // //         return SingleChildScrollView(
// // //           child: Center(
// // //             child: Container(
// // //               // White box in the center
// // //               width: MediaQuery.of(context).size.width * 0.85,
// // //               margin: const EdgeInsets.only(top: 20, bottom: 20),
// // //               padding: const EdgeInsets.all(20),
// // //               decoration: BoxDecoration(
// // //                 color: Colors.white,
// // //                 borderRadius: BorderRadius.circular(12),
// // //               ),
// // //               child: Form(
// // //                 key: _formKey,
// // //                 autovalidateMode: AutovalidateMode.onUserInteraction,
// // //                 child: Column(
// // //                   mainAxisSize: MainAxisSize.min,
// // //                   children: [
// // //                     // Mobile Number
// // //                     TextFormField(
// // //                       controller: authController.phoneController,
// // //                       keyboardType: TextInputType.phone,
// // //                       decoration: InputDecoration(
// // //                         labelText: 'Mobile Number',
// // //                         hintText: 'Enter Phone Number',
// // //                         prefixIcon: const Icon(Icons.phone),
// // //                         border: OutlineInputBorder(
// // //                           borderRadius: BorderRadius.circular(8.0),
// // //                         ),
// // //                       ),
// // //                       validator: (value) {
// // //                         if (value == null || value.isEmpty) {
// // //                           return 'Please enter your phone number';
// // //                         }
// // //                         if (!authController.isValidPhoneNumber(value)) {
// // //                           return 'Please enter a valid phone number';
// // //                         }
// // //                         return null;
// // //                       },
// // //                     ),
// // //                     const SizedBox(height: 15),
                    
// // //                     // Password
// // //                     Obx(
// // //                       () => TextFormField(
// // //                         controller: authController.passwordController,
// // //                         obscureText: !authController.showPassword.value,
// // //                         decoration: InputDecoration(
// // //                           labelText: 'Password',
// // //                           hintText: 'At least 8 characters',
// // //                           prefixIcon: const Icon(Icons.lock),
// // //                           suffixIcon: IconButton(
// // //                             icon: Icon(
// // //                               authController.showPassword.value
// // //                                   ? Icons.visibility
// // //                                   : Icons.visibility_off,
// // //                             ),
// // //                             onPressed: () {
// // //                               authController.showPassword.toggle();
// // //                             },
// // //                           ),
// // //                           border: OutlineInputBorder(
// // //                             borderRadius: BorderRadius.circular(8.0),
// // //                           ),
// // //                         ),
// // //                         validator: (value) {
// // //                           if (value == null || value.isEmpty) {
// // //                             return 'Please enter a password';
// // //                           }
// // //                           if (value.length < 8) {
// // //                             return 'Password must be at least 8 characters';
// // //                           }
// // //                           return null;
// // //                         },
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 15),
                    
// // //                     // Forgot Password
// // //                     Align(
// // //                       alignment: Alignment.centerRight,
// // //                       child: TextButton(
// // //                         onPressed: () => Get.to(() => ForgotPasswordScreen()),
// // //                         child: const Text('Forgot Password?'),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 10),
                    
// // //                     // Sign In button
// // //                     ElevatedButton(
// // //                       onPressed: () {
// // //                         if (_formKey.currentState!.validate()) {
// // //                           // If form is valid, proceed with sign in
// // //                           Get.to(() => WelcomeScreen());
// // //                         }
// // //                       },
// // //                       style: ElevatedButton.styleFrom(
// // //                         minimumSize: const Size(double.infinity, 50),
// // //                         backgroundColor: Colors.black,
// // //                         shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(8),
// // //                         ),
// // //                       ),
// // //                       child: const Text(
// // //                         'Sign In',
// // //                         style: TextStyle(
// // //                           fontSize: 18,
// // //                           color: Colors.white,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(height: 20),

// // //                     // Divider with text "Or sign in with"
// // //                     Row(
// // //                       children: const [
// // //                         Expanded(child: Divider(thickness: 1)),
// // //                         Padding(
// // //                           padding: EdgeInsets.symmetric(horizontal: 8.0),
// // //                           child: Text('Or sign in with'),
// // //                         ),
// // //                         Expanded(child: Divider(thickness: 1)),
// // //                       ],
// // //                     ),
// // //                     const SizedBox(height: 20),

// // //                     // Google / Facebook buttons
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         // Google button
// // //                         InkWell(
// // //                           onTap: () {
// // //                             // TODO: Implement Google sign in
// // //                           },
// // //                           child: SingleChildScrollView(
// // //                             child: Row(
// // //                               children: [
                              
// // //                                 Container(
// // //                                   padding: const EdgeInsets.all(8.0),
// // //                                   decoration: BoxDecoration(
// // //                                     border: Border.all(color: Colors.grey),
// // //                                     shape: BoxShape.circle,
// // //                                   ),
// // //                                   child: Image.asset(
// // //                                     'assets/google_icon.png',
// // //                                     width: 24,
// // //                                     height: 24,
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ),
// // //                         ),
// // //                         const SizedBox(width: 40),
// // //                         // Facebook button
// // //                         InkWell(
// // //                           onTap: () {
// // //                             // TODO: Implement Facebook sign in
// // //                           },
// // //                           child: Container(
// // //                             padding: const EdgeInsets.all(8.0),
// // //                             decoration: BoxDecoration(
// // //                               border: Border.all(color: Colors.grey),
// // //                               shape: BoxShape.circle,
// // //                             ),
// // //                             child: Image.asset(
// // //                               'assets/facebook_icon.png',
// // //                               width: 24,
// // //                               height: 24,
// // //                             ),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     const SizedBox(height: 30),
                    
// // //                     // Don't have an account? Sign up
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.center,
// // //                       children: [
// // //                         const Text("Don't you have an account?"),
// // //                         TextButton(
// // //                           onPressed: () {
// // //                             Get.toNamed('/signup');
// // //                           },
// // //                           child: const Text(
// // //                             'Sign up',
// // //                             style: TextStyle(fontWeight: FontWeight.bold),
// // //                           ),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //         );
// // //       }),
// // //     );
// // //   }
// // // }
// // // ... your previous imports and code

// // class SignInPage extends StatelessWidget {
// //   final AuthController authController = Get.put(AuthController());
// //   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// //   SignInPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       // Dark background
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         title: const Text('Sign In Page'),
// //         centerTitle: true,
// //         elevation: 0,
// //       ),
// //       body: Obx(() {
// //         // Show loading indicator if needed
// //         if (authController.isLoading.value) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //         // Main content
// //         return SingleChildScrollView(
// //           child: Center(
// //             child: Container(
// //               // White box in the center
// //               width: MediaQuery.of(context).size.width * 0.85,
// //               margin: const EdgeInsets.only(top: 20, bottom: 20),
// //               padding: const EdgeInsets.all(20),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: Form(
// //                 key: _formKey,
// //                 autovalidateMode: AutovalidateMode.onUserInteraction,
// //                 child: Column(
// //                   mainAxisSize: MainAxisSize.min,
// //                   children: [
// //                     // Mobile Number
// //                     TextFormField(
// //                       controller: authController.phoneController,
// //                       keyboardType: TextInputType.phone,
// //                       decoration: InputDecoration(
// //                         labelText: 'Mobile Number',
// //                         hintText: 'Enter Phone Number',
// //                         prefixIcon: const Icon(Icons.phone),
// //                         border: OutlineInputBorder(
// //                           borderRadius: BorderRadius.circular(8.0),
// //                         ),
// //                       ),
// //                       validator: (value) {
// //                         if (value == null || value.isEmpty) {
// //                           return 'Please enter your phone number';
// //                         }
// //                         if (!authController.isValidPhoneNumber(value)) {
// //                           return 'Please enter a valid phone number';
// //                         }
// //                         return null;
// //                       },
// //                     ),
// //                     const SizedBox(height: 15),
                    
// //                     // Password
// //                     Obx(
// //                       () => TextFormField(
// //                         controller: authController.passwordController,
// //                         obscureText: !authController.showPassword.value,
// //                         decoration: InputDecoration(
// //                           labelText: 'Password',
// //                           hintText: 'At least 8 characters',
// //                           prefixIcon: const Icon(Icons.lock),
// //                           suffixIcon: IconButton(
// //                             icon: Icon(
// //                               authController.showPassword.value
// //                                   ? Icons.visibility
// //                                   : Icons.visibility_off,
// //                             ),
// //                             onPressed: () {
// //                               authController.showPassword.toggle();
// //                             },
// //                           ),
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8.0),
// //                           ),
// //                         ),
// //                         validator: (value) {
// //                           if (value == null || value.isEmpty) {
// //                             return 'Please enter a password';
// //                           }
// //                           if (value.length < 8) {
// //                             return 'Password must be at least 8 characters';
// //                           }
// //                           return null;
// //                         },
// //                       ),
// //                     ),
// //                     const SizedBox(height: 15),
                    
// //                     // Forgot Password
// //                     Align(
// //                       alignment: Alignment.centerRight,
// //                       child: TextButton(
// //                         onPressed: () =>
// //                             Get.to(() => ForgotPasswordScreen()),
// //                         child: const Text('Forgot Password?'),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 10),
                    
// //                     // Sign In button
// //                     ElevatedButton(
// //                       onPressed: () {
// //                         if (_formKey.currentState!.validate()) {
// //                           // If form is valid, proceed with sign in
// //                           Get.to(() => WelcomeScreen());
// //                         }
// //                       },
// //                       style: ElevatedButton.styleFrom(
// //                         minimumSize: const Size(double.infinity, 50),
// //                         backgroundColor: Colors.black,
// //                         shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(8),
// //                         ),
// //                       ),
// //                       child: const Text(
// //                         'Sign In',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           color: Colors.white,
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),

// //                     // Divider with text "Or sign in with"
// //                     Row(
// //                       children: const [
// //                         Expanded(child: Divider(thickness: 1)),
// //                         Padding(
// //                           padding: EdgeInsets.symmetric(horizontal: 8.0),
// //                           child: Text('Or sign in with'),
// //                         ),
// //                         Expanded(child: Divider(thickness: 1)),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 20),

// //                     // Google / Facebook buttons
// //                     // Row(
// //                     //   mainAxisAlignment: MainAxisAlignment.center,
// //                     //   children: [
// //                     //     // Google button
// //                     //     InkWell(
// //                     //       onTap: () {
// //                     //         // TODO: Implement Google sign in
// //                     //       },
// //                     //       child: Container(
// //                     //         padding: const EdgeInsets.all(8.0),
// //                     //         decoration: BoxDecoration(
// //                     //           border: Border.all(color: Colors.grey),
// //                     //           shape: BoxShape.circle,
// //                     //         ),
// //                     //         child: Image.asset(
// //                     //           'assets/google_icon.png',
// //                     //           width: 24,
// //                     //           height: 24,
// //                     //         ),
// //                     //       ),
// //                     //     ),
// //                     //     const SizedBox(width: 40),
// //                     //     // Facebook button
// //                     //     InkWell(
// //                     //       onTap: () {
// //                     //         // TODO: Implement Facebook sign in
// //                     //       },
// //                     //       child: Container(
// //                     //         padding: const EdgeInsets.all(8.0),
// //                     //         decoration: BoxDecoration(
// //                     //           border: Border.all(color: Colors.grey),
// //                     //           shape: BoxShape.circle,
// //                     //         ),
// //                     //         child: Image.asset(
// //                     //           'assets/facebook_icon.jpeg',
// //                     //           width: 24,
// //                     //           height: 24,
// //                     //         ),
// //                     //       ),
// //                     //     ),
// //                     //   ],
// //                     // ),// Google / Facebook buttons with logos and names
// // Row(
// //   mainAxisAlignment: MainAxisAlignment.center,
// //   children: [
// //     // Google button
// //     InkWell(
// //       onTap: () {
// //         // TODO: Implement Google sign in
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.all(8.0),
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.grey),
// //           borderRadius: BorderRadius.circular(8.0),
// //         ),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Image.asset(
// //               'assets/google_icon.png',
// //               width: 24,
// //               height: 24,
// //             ),
// //             const SizedBox(height: 4),
// //             const Text(
// //               'Google',
// //               style: TextStyle(fontSize: 12),
// //             ),
// //           ],
// //         ),
// //       ),
// //     ),
// //     const SizedBox(width: 40),
// //     // Facebook button
// //     InkWell(
// //       onTap: () {
// //         // TODO: Implement Facebook sign in
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.all(8.0),
// //         decoration: BoxDecoration(
// //           border: Border.all(color: Colors.grey),
// //           borderRadius: BorderRadius.circular(8.0),
// //         ),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Image.asset(
// //               'assets/facebook_icon.jpeg',
// //               width: 24,
// //               height: 24,
// //             ),
// //             const SizedBox(height: 4),
// //             const Text(
// //               'Facebook',
// //               style: TextStyle(fontSize: 12),
// //             ),
// //           ],
// //         ),
// //       ),
// //     ),
// //   ],
// // ),


// //                     const SizedBox(height: 30),
                    
// //                     // Don't have an account? Sign up
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         const Text("Don't you have an account?"),
// //                         TextButton(
// //                           onPressed: () {
// //                             Get.toNamed('/signup');
// //                           },
// //                           child: const Text(
// //                             'Sign up',
// //                             style: TextStyle(fontWeight: FontWeight.bold),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'auth_service.dart'; // Import the AuthService file

// class SignInPage extends StatelessWidget {
//   final AuthService _authService = AuthService();

//   SignInPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: const Text('Sign In Page'),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Google Sign In Button
//             InkWell(
//               onTap: () async {
//                 try {
//                   await _authService.signInWithGoogle();
//                   // Handle successful sign in (e.g., navigate to home screen)
//                   Get.toNamed('/home');
//                 } catch (e) {
//                   // Handle error
//                   Get.snackbar('Error', e.toString());
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(
//                       'assets/google_icon.png',
//                       width: 24,
//                       height: 24,
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Text('Google', style: TextStyle(fontSize: 12)),
//                         SizedBox(width: 4),
//                         Icon(Icons.star, size: 12, color: Colors.yellow),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(width: 40),
//             // Facebook Sign In Button
//             InkWell(
//               onTap: () async {
//                 try {
//                   await _authService.signInWithFacebook();
//                   // Handle successful sign in (e.g., navigate to home screen)
//                   Get.toNamed('/home');
//                 } catch (e) {
//                   // Handle error
//                   Get.snackbar('Error', e.toString());
//                 }
//               },
//               child: Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Image.asset(
//                       'assets/facebook_icon.png',
//                       width: 24,
//                       height: 24,
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: const [
//                         Text('Facebook', style: TextStyle(fontSize: 12)),
//                         SizedBox(width: 4),
//                         Icon(Icons.star, size: 12, color: Colors.yellow),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_service.dart'; // Import the AuthService file

class SignInPage extends StatelessWidget {
  final AuthService _authService = AuthService();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Sign In Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Google Sign In Button
            InkWell(
              onTap: () async {
                try {
                  await _authService.signInWithGoogle();
                  // Handle successful sign in (e.g., navigate to home screen)
                  Get.toNamed('/home');
                } catch (e) {
                  // Handle error
                  Get.snackbar('Error', e.toString());
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/google_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Google', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4),
                        Icon(Icons.star, size: 12, color: Colors.yellow),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 40),
            // Facebook Sign In Button
            InkWell(
              onTap: () async {
                try {
                  await _authService.signInWithFacebook();
                  // Handle successful sign in (e.g., navigate to home screen)
                  Get.toNamed('/home');
                } catch (e) {
                  // Handle error
                  Get.snackbar('Error', e.toString());
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/facebook_icon.png',
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Facebook', style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4),
                        Icon(Icons.star, size: 12, color: Colors.yellow),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
