import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/controller/auth_controller.dart';
import 'package:kangaroo_customer_app/screen/forgot_password_screen.dart';
import 'package:kangaroo_customer_app/welcome_screen.dart';



class SignInPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Dark background
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Sign In Page'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
   
        if (authController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
      
        return SingleChildScrollView(
          child: Center(
            child: Container(

              width: MediaQuery.of(context).size.width * 0.85,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
         
                    TextFormField(
                      controller: authController.phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        hintText: 'Enter Phone Number',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!authController.isValidPhoneNumber(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                    ),
              
Obx(() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const SizedBox(height: 10,),
    const Text(
      'Select Email Type',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    Row(
      children: [
        Radio<String>(
          value: 'personal',
          groupValue: authController.emailType.value,
          onChanged: (value) {
            authController.emailType.value = value!;
          },
        ),
        const Text('Personal'),
      
        Radio<String>(
          value: 'professional',
          groupValue: authController.emailType.value,
          onChanged: (value) {
            authController.emailType.value = value!;
          },
        ),
        const Text('Professional '),
      ],
    ),
 
  ],
)),
   const SizedBox(height: 15),
                  TextFormField(
                    controller: authController.emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!GetUtils.isEmail(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
            const SizedBox(height: 15,),
                    Obx(
                      () => TextFormField(
                        controller: authController.passwordController,
                        obscureText: !authController.showPassword.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'At least 8 characters',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              authController.showPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              authController.showPassword.toggle();
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.to(() => ForgotPasswordScreen()),
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    
                 
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                      
                          Get.to(() => WelcomeScreen());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                   
                    const SizedBox(height: 30),
                 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't you have an account?"),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/signup');
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}