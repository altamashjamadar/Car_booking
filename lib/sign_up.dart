
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/auth_controller.dart';

class SignUpPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.white,
      appBar: AppBar(
              backgroundColor: Colors.white,
        title: const Text('Sign Up'),
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
              key: _signUpFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      TextFormField(
                    controller: authController.nameController,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                      labelText: 'Full Name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: authController.phoneController,
                    keyboardType: TextInputType.phone,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                      labelText: 'Phone Number',
                      prefixIcon: Icon(Icons.phone),
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
                      // if (value == null || value.isEmpty) {
                      //   return 'Please enter your email';
                      // }
                      if((value == null || value.isEmpty) && authController.emailType.value=='professional' ){
                        return 'Please enter your Work email';
                      }
                      if((value == null || value.isEmpty) && authController.emailType.value=='personal' ){
                        return 'Please enter your Personal email';
                      }

                      if (!GetUtils.isEmail(value!)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
            const SizedBox(height: 15,),
                  Obx(() => TextFormField(
                    controller: authController.passwordController,
                    obscureText: !authController.showPassword.value,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                      labelText: 'Password (min 8 characters)',
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
                         TextFormField(
                    //controller: authController.nameController,
                    decoration:  InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                      labelText: 'Refferal Code',
                      hintText: 'Enter Referral Code',
                    
                    ),
                         ),
                         SizedBox(height: 15,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      
                      style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () async {
                        if (_signUpFormKey.currentState!.validate()) {
                          await authController.sendOTP();
                          if (authController.otpSent.value) {
                            Get.toNamed('/otp', 
                              arguments: authController.phoneController.text);
                          }
                        }
                      },
                      child: const Text(
                        'SIGN UP',
                        style: TextStyle(fontSize: 16,
                        color: Colors.black,
                        ),
                        
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        ),
      ),
    );
  }
}
