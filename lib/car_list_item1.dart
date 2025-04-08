// lib/widgets/car_list_item.dart
import 'package:flutter/material.dart';

class CarListItem extends StatelessWidget {
  final String carName;
  final String price;
  final String timeAway;

  const CarListItem({
    Key? key,
    required this.carName,
    required this.price,
    required this.timeAway,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.directions_car),
      title: Text(
        carName,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text('$price · $timeAway'),
      onTap: () {
        // Handle tap if needed
      },
    );
  }
}
