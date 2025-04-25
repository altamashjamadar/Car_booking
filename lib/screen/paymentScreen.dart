import 'package:flutter/material.dart';
import 'package:kangaroo_customer_app/UI/custom_Card.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  //  final List<PaymentMethod> paymentMethods = const [
  //   PaymentMethod(
  //     name: 'Credit Card',
  //     iconData: Icons.credit_card,
  //     description: 'Visa, Mastercard, and more',
  //   ),
  //   PaymentMethod(
  //     name: 'Debit Card',
  //     iconData: Icons.account_balance_wallet,
  //     description: 'Local bank cards',
  //   ),
  //   PaymentMethod(
  //     name: 'Net Banking',
  //     iconData: Icons.language,
  //     description: 'Online banking transfers',
  //   ),
  //   PaymentMethod(
  //     name: 'e-Wallet',
  //     iconData: Icons.account_balance,
  //     description: 'Pay via popular wallets',
  //   ),
  //   PaymentMethod(
  //     name: 'UPI',
  //     iconData: Icons.phone_android,
  //     description: 'Use UPI ID for quick payments',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payment Methods'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomCard(
              leading: Icon(Icons.credit_card),
              title: Text("Credit Card"),
              subtitle: Text("Visa, Mastercard, and more"),
              trailing: Icon(Icons.chevron_right),
            ),
            CustomCard(
              leading: Icon(Icons.credit_card),
              title: Text("Debit Card"),
              subtitle: Text("Local bank cards"),
              trailing: Icon(Icons.chevron_right),
            ),
            CustomCard(
              leading: Icon(Icons.credit_card),
              title: Text("Net Banking"),
              subtitle: Text("Online Bank Transfer"),
              trailing: Icon(Icons.chevron_right),
            ),
            CustomCard(
              leading: Icon(Icons.credit_card),
              title: Text("E-Wallet"),
              subtitle: Text("Pay via popular wallets"),
              trailing: Icon(Icons.chevron_right),
            ),
            CustomCard(
              leading: Icon(Icons.credit_card),
              title: Text("UPI"),
              subtitle: Text("Use UPI ID for quick payments"),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      )
      // ListView.separated(
      //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

        
      //   itemCount: paymentMethods.length,
      //   separatorBuilder: (context, index) => const SizedBox(height: 12),
      //   itemBuilder: (context, index) {
      //     final method = paymentMethods[index];
      //     return PaymentMethodCard(paymentMethod: method);
      //   },
      // ),
    );
  }
}

// class PaymentMethod {
//   final String name;
//   final IconData iconData;
//   final String description;

//   const PaymentMethod({
//     required this.name,
//     required this.iconData,
//     required this.description,
//   });
// }

// class PaymentMethodCard extends StatelessWidget {
//   final PaymentMethod paymentMethod;

//   const PaymentMethodCard({Key? key, required this.paymentMethod}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.amber,
//       elevation: 2,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         leading: Icon(
//           paymentMethod.iconData,
//           size: 32,
//           color: Colors.black54,
//         ),
//         title: Text(
//           paymentMethod.name,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         subtitle: Text(
//           paymentMethod.description,
//           style: const TextStyle(fontSize: 14, color: Colors.black54),
//         ),
//         trailing: const Icon(Icons.chevron_right),
        
//       ),
//     );
//   }
// }
