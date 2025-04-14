import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({Key? key}) : super(key: key);

  // Dummy list of payment methods
  final List<PaymentMethod> paymentMethods = const [
    PaymentMethod(
      name: 'Credit Card',
      iconData: Icons.credit_card,
      description: 'Visa, Mastercard, and more',
    ),
    PaymentMethod(
      name: 'Debit Card',
      iconData: Icons.account_balance_wallet,
      description: 'Local bank cards',
    ),
    PaymentMethod(
      name: 'Net Banking',
      iconData: Icons.language,
      description: 'Online banking transfers',
    ),
    PaymentMethod(
      name: 'e-Wallet',
      iconData: Icons.account_balance,
      description: 'Pay via popular wallets',
    ),
    PaymentMethod(
      name: 'UPI',
      iconData: Icons.phone_android,
      description: 'Use UPI ID for quick payments',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Methods'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),

        
        itemCount: paymentMethods.length,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final method = paymentMethods[index];
          return PaymentMethodCard(paymentMethod: method);
        },
      ),
    );
  }
}

class PaymentMethod {
  final String name;
  final IconData iconData;
  final String description;

  const PaymentMethod({
    required this.name,
    required this.iconData,
    required this.description,
  });
}

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;

  const PaymentMethodCard({Key? key, required this.paymentMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Icon(
          paymentMethod.iconData,
          size: 32,
          color: Colors.black54,
        ),
        title: Text(
          paymentMethod.name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          paymentMethod.description,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // Add your onTap functionality here. For example, navigate to a payment detail or add a new card.
        },
      ),
    );
  }
}
