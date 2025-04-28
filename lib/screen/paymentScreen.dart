import 'package:flutter/material.dart';
import 'package:kangaroo_customer_app/UI/custom_Card.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment Methods'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GradientTopCard(
                leading: Icon(Icons.credit_card),
                title: Text("Credit Card"),
                subtitle: Text("Visa, Mastercard, and more"),
                trailing: Icon(Icons.chevron_right),
              ),
              GradientTopCard(
                leading: Icon(Icons.credit_card),
                title: Text("Debit Card"),
                subtitle: Text("Local bank cards"),
                trailing: Icon(Icons.chevron_right),
              ),
              GradientTopCard(
                leading: Icon(Icons.credit_card),
                title: Text("Net Banking"),
                subtitle: Text("Online Bank Transfer"),
                trailing: Icon(Icons.chevron_right),
              ),
              GradientTopCard(
                leading: Icon(Icons.credit_card),
                title: Text("E-Wallet"),
                subtitle: Text("Pay via popular wallets"),
                trailing: Icon(Icons.chevron_right),
              ),
              GradientTopCard(
                leading: Icon(Icons.credit_card),
                title: Text("UPI"),
                subtitle: Text("Use UPI ID for quick payments"),
                trailing: Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      )
      
    );
  }
}
