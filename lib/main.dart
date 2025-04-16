import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/all_cars_search.dart';
import 'package:kangaroo_customer_app/auth_controller.dart';
import 'package:kangaroo_customer_app/car_booking_screen.dart';
import 'package:kangaroo_customer_app/car_home_page.dart';
import 'package:kangaroo_customer_app/car_selection_screen.dart';
// import 'package:kangaroo_customer_app/car_selection_screen.dart';
import 'package:kangaroo_customer_app/forgot_password_screen.dart';
import 'package:kangaroo_customer_app/location_screen.dart';
import 'package:kangaroo_customer_app/map_controller.dart';
import 'package:kangaroo_customer_app/password_reset_success_screen.dart';
import 'package:kangaroo_customer_app/paymentScreen.dart';
import 'package:kangaroo_customer_app/rideScreen.dart';
import 'package:kangaroo_customer_app/routes.dart';
import 'package:kangaroo_customer_app/savedPlacesScreen.dart';
import 'package:kangaroo_customer_app/settingScreen.dart';
import '../splashscreen.dart';
import '/welcome_screen.dart';
// import '/car_booking_screen.dart';
import '/sign_in_page.dart';
import '/sign_up.dart';
import '/otp_screen.dart';
import '/map_screen.dart';
// import '/home_screen.dart';


void main() {
  Get.put(AuthController());
  Get.lazyPut(() => MapController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kangaroo Customer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splash',
      // initialRoute: '/car-selection',
      // initialRoute: '/all-car-selection',
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/signin', page: () =>  SignInPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/otp', page: () => OTPScreen(phone: Get.arguments)),
        GetPage(name: '/home', page: () => CarHomePage()),
        // GetPage(name: '/booking', page: () => CarBookingScreen()),
        GetPage(name: '/forgot-password', page: () => ForgotPasswordScreen()),
         GetPage(name: '/map', page: () => MapScreen()), 
         GetPage(name: '/your-route', page: () => YourRouteScreen()), 
         GetPage(name: '/car-selection', page: () => CarSelectionScreen()),
         GetPage(name: '/SettingsScreen', page: () => SettingsScreen()),
         GetPage(name: '/ride', page: () => YourRidesScreen()),
         GetPage(name: '/savedPlaces', page: () => SavedPlacesScreen()),
           GetPage(name: '/Payment', page: () => PaymentMethodsScreen()),
           GetPage(name: '/Booking', page: () => CarBookingScreen()),
          GetPage(name: '/passwordReset',page: () =>  PasswordResetSuccessScreen(),),
         GetPage(name: Routes.map,page: () => MapScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut<MapController>(() => MapController());
  }),
),
        // GetPage(name: '/carHome', page: () => CarHomePage(),),
        GetPage(name: '/all-car-selection', page: () => AllCarsSearch()), 
      ],
    );
  }
}




