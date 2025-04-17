
import 'package:flutter/material.dart';
import 'package:kangaroo_customer_app/screen/selected_car.dart';

class AllCarsSearch extends StatelessWidget {
  const AllCarsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
              backgroundColor: Colors.white,
        title: Text(
          'All Cars ( ${cars.length} )',
          textAlign: TextAlign.center,
          
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            // decoration: BoxDecoration(
            //   color: Colors.grey[100],
            //   borderRadius: BorderRadius.circular(30),
            // ),
            child:  TextField(
            decoration: InputDecoration(
              hintText: 'Search car',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
          ), 
            // Row(
            //   children: [
            //     const Icon(Icons.search, color: Colors.blueGrey),
            //     const SizedBox(width: 8),
            //     Expanded(
            //       child: 
          //         TextField(
          //   decoration: InputDecoration(
          //     hintText: 'Search car',
          //     prefixIcon: const Icon(Icons.search),
          //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          //   ),
          // ),
                  // Text(
                  //   'Search Cars',
                  //   style: TextStyle(fontSize: 16),
                  // ),
            //     ),
            //   ],
            // ),
          ),
          const SizedBox(height: 10),
        
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: cars.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectedCar(selectedCar: cars[index]),
                    ),
                  );
                },
                child: CarCard(car: cars[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Car {
  final String name;
  final String price;
  final String numberPlate;
  final String color;
  final String model;
  final String seat;
  final String imagePath;

  const Car({
    required this.name,
    required this.numberPlate,
    required this.color,
    required this.seat,
    required this.model,
    required this.price,
    required this.imagePath,
  });
}

const List<Car> cars = [
  Car(
  name: 'Audi R8',
  price: '\$1,120/day',
  color: 'Silver',
  seat: '2 seats',
  model: 'R8 V10 Plus',
  numberPlate: 'AUDI-R8',
  imagePath: 'assets/cars/audi R8.jpeg',
),
Car(
  name: 'Mercedes',
  price: '\$2,254/day',
  color: 'Black',
  seat: '5 seats',
  model: 'E-Class',
  numberPlate: 'MER-1234',
  imagePath: 'assets/cars/Mercedes.jpeg',
),
Car(
  name: 'Audi S5',
  price: '\$2,810/day',
  color: 'Red',
  seat: '4 seats',
  model: 'S5 Sportback',
  numberPlate: 'AUDI-S5',
  imagePath: 'assets/cars/Audi_S5.jpeg',
),
Car(
  name: 'Alfa Romeo F4',
  price: '\$2,810/day',
  color: 'Rosso Alfa',
  seat: '2 seats',
  model: '4C Spider',
  numberPlate: 'ALFA-4C',
  imagePath: 'assets/cars/Alfa_Romeo_F4.jpeg',
),
Car(
  name: 'Limousine',
  price: '\$2,810/day',
  color: 'White',
  seat: '8 seats',
  model: 'Lincoln Town Car Stretch',
  numberPlate: 'LIMO-001',
  imagePath: 'assets/cars/Limousine.jpeg',
),
Car(
  name: 'Bentley',
  price: '\$2,810/day',
  color: 'Blue',
  seat: '4 seats',
  model: 'Continental GT',
  numberPlate: 'BEN-789',
  imagePath: 'assets/cars/Bentley.jpeg',
),


];

// Car Card Widget
class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Car Image
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              car.imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Car Details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  car.price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
