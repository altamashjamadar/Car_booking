import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroo_customer_app/screen/all_cars_search.dart';
import 'package:kangaroo_customer_app/controller/auth_controller.dart';
import 'package:kangaroo_customer_app/screen/cancel_ride.dart';
import 'package:kangaroo_customer_app/screen/car_booking_screen.dart';
import 'package:kangaroo_customer_app/screen/car_home_page.dart';
import 'package:kangaroo_customer_app/screen/car_selection_screen.dart';
import 'package:kangaroo_customer_app/screen/confirmRide.dart';
import 'package:kangaroo_customer_app/screen/driver_details_screen.dart';
// import 'package:kangaroo_customer_app/car_selection_screen.dart';
import 'package:kangaroo_customer_app/screen/forgot_password_screen.dart';
import 'package:kangaroo_customer_app/screen/inprogress_Ride_screen.dart';
import 'package:kangaroo_customer_app/screen/location_screen.dart';
import 'package:kangaroo_customer_app/controller/map_controller.dart';
import 'package:kangaroo_customer_app/screen/password_reset_success_screen.dart';
import 'package:kangaroo_customer_app/screen/paymentScreen.dart';
import 'package:kangaroo_customer_app/screen/refferal_screen.dart';
import 'package:kangaroo_customer_app/screen/rideScreen.dart';
import 'package:kangaroo_customer_app/screen/routes.dart';
import 'package:kangaroo_customer_app/screen/savedPlacesScreen.dart';
import 'package:kangaroo_customer_app/screen/settingScreen.dart';
import '../splashscreen.dart';
import '/welcome_screen.dart';
// import '/car_booking_screen.dart';
import '/sign_in_page.dart';
import '/sign_up.dart';
import 'screen/otp_screen.dart';
import 'screen/map_screen.dart';
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
      // initialRoute: '/confirmRide',
      
      getPages: [
        GetPage(name: '/splash', page: () => const SplashScreen()),
        GetPage(name: '/welcome', page: () => const WelcomeScreen()),
        GetPage(name: '/signin', page: () =>  SignInPage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/otp', page: () => OTPScreen(phone: Get.arguments)),
        GetPage(name: '/home', page: () => CarHomePage()),
        GetPage(name: '/booking', page: () => CarBookingScreen()),
        GetPage(name: '/forgot-password', page: () => ForgotPasswordScreen()),
         GetPage(name: '/map', page: () => MapScreen()), 
        //  GetPage(name: '/refer', page: () => RefferalScreen()), 
         GetPage(name: '/referScreen', page: () => ReferralScreen()), 
         GetPage(name: '/your-route', page: () => YourRouteScreen()), 
         GetPage(name: '/car-selection', page: () => CarSelectionScreen()),
         GetPage(name: '/SettingsScreen', page: () => SettingsScreen()),
         GetPage(name: '/ride', page: () => YourRidesScreen()),
         GetPage(name: '/confirmRide', page: () => ConfirmRide()),
         GetPage(name: '/inprogressRide', page: () => InprogressRideScreen()),
         GetPage(name: '/cancelRide', page: () => CancelRide()),
         GetPage(name: '/Driver', page: () => DriverDetailsScreen()),
         GetPage(name: '/savedPlaces', page: () => SavedPlacesScreen()),
           GetPage(name: '/Payment', page: () => PaymentMethodsScreen()),
           GetPage(name: '/Booking', page: () => CarBookingScreen()),
          GetPage(name: '/passwordReset',page: () =>  PasswordResetSuccessScreen(),),
         GetPage(name: Routes.map,page: () => MapScreen(),
  binding: BindingsBuilder(() {
    Get.lazyPut<MapController>(() => MapController());
  }),
),
        GetPage(name: '/carHome', page: () => CarHomePage(),),
        GetPage(name: '/all-car-selection', page: () => AllCarsSearch()), 
      ],
    );
  }
}




