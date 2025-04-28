import 'package:flutter/material.dart';
// import 'package:kangaroo_customer_app/UI/custom_Card.dart';

class Promos extends StatelessWidget {
  const Promos({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Promos"),
        leading: Icon(Icons.chevron_left),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(),
                Container(),

                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Welcome to Kangaroo Cars! Enjoy 20% OFF your first ride—use code KANGAROO20.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "New here? Hop in and save! 15% off on your first trip with promo NEWKANG.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Love Kangaroo? Refer a friend and you`ll both get ₹200 ride credit!",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Share your code ABC123—every successful friend sign-up earns you free rides.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Flash Sale! Get 25% off between 5-8 PM today. Just open the app and tap “Flash Promo!.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Welcome to Kangaroo Cars! Enjoy 20% OFF your first ride—use code KANGAROO20.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "New here? Hop in and save! 15% off on your first trip with promo NEWKANG.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Love Kangaroo? Refer a friend and you`ll both get ₹200 ride credit!",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Share your code ABC123—every successful friend sign-up earns you free rides.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),
                // CustomCard(
                //   leading: Icon(Icons.discount, color: Colors.black),
                //   subtitle: Text(
                //     "Flash Sale! Get 25% off between 5-8 PM today. Just open the app and tap “Flash Promo!.",
                //   ),
                //   trailing: Icon(Icons.chevron_right),
                // ),

                // customCard(
                //   "Welcome to Kangaroo Cars! Enjoy 20% OFF your first ride—use code KANGAROO20 at checkout.",
                // ),
                // customCard(
                //   "New here? Hop in and save! 15% off on your first trip with promo NEWKANG.",
                // ),
                // customCard(
                //   "Love Kangaroo? Refer a friend and you`ll both get ₹200 ride credit!",
                // ),
                // customCard(
                //   "Share your code ABC123—every successful friend sign-up earns you free rides.",
                // ),
                // customCard(
                //   "Flash Sale! Get 25% off between 5-8 PM today. Just open the app and tap “Flash Promo!.",
                // ),
                // customCard(
                //   "Welcome to Kangaroo Cars! Enjoy 20% OFF your first ride—use code KANGAROO20 at checkout.",
                // ),
                // customCard(
                //   "New here? Hop in and save! 15% off on your first trip with promo NEWKANG.",
                // ),
                // customCard(
                //   "Love Kangaroo? Refer a friend and you'll both get ₹200 ride credit!",
                // ),
                // customCard(
                //   "Share your code ABC123—every successful friend sign-up earns you free rides.",
                // ),
                // customCard(
                //   "Flash Sale! Get 25% off between 5-8 PM today. Just open the app and tap “Flash Promo!.",
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
