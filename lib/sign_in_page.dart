import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/controller/auth_controller.dart';
// import 'package:kangaroo_customer_app/car_home_page.dart';
import 'package:kangaroo_customer_app/screen/forgot_password_screen.dart';
import 'package:kangaroo_customer_app/welcome_screen.dart';



class SignInPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      // Dark background
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   toolbarHeight: size.height*0.1,
      //   backgroundColor: Colors.white,
        
      //   title: const Text('Sign In Page',),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: Obx(() {
    
        if (authController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        
        return 
        SingleChildScrollView(
          child:
           Center(
            child: Container(
                    
              width: size.width * 0.85,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              // SizedBox(height: 30,),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height*0.2,),
                    Text("Sign in",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    // ),Text('\t     \t          in',
                    // style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),

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
                    const SizedBox(height: 10),
                    
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
                    const SizedBox(height: 3),
                    
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
                        minimumSize: const Size(double.infinity,50),

                        padding: const EdgeInsets.symmetric(vertical: 15),
                        backgroundColor: Colors.amber,
                       
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    // const Spacer(),

                   
                    // Column(
                    //   children: [
                        
                    //   ],
                    // ),
                    
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