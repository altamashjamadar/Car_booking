// import 'package:flutter/material.dart';
// import 'package:kangaroo_customer_app/car_home_page.dart';

// class AllCarsSearch extends StatelessWidget {
//   const AllCarsSearch({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("All Cars"),
//       ),
//       body: 
//       Column(
        
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//             // padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(30),
//                       ),
//             child: Row(
//               children: [
//                               const Icon(Icons.search, color: Colors.blueGrey),
//                               const SizedBox(width: 8),
//                               const Expanded(
//                                 child: Text(
//                                   'Search Cars',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                               ),
//                               // CircleAvatar(
//                               //   backgroundImage: NetworkImage(
//                               //     'https://storage.googleapis.com/a1aa/image/TDHTYnXayCIm_3ssh98iec3cSY2agCCW6rDp5aSCwHM.jpg',
//                               //   ),
//                               // ),
//                             ],
//             ),
            
//           ),
//           SizedBox(height: 10,),
//          Expanded(
//            child: ListView(
//                 scrollDirection: Axis.vertical,
//                 physics: const BouncingScrollPhysics(),
//                 children:  [
//                   CarListItem(carName: 'Audi R8', price: '\$1,120/day', timeAway: '1 min away',imagePath: 'assets/cars/audi R8.jpeg'),
//                   CarListItem(carName: 'Mercedes', price: '\$2,254/day', timeAway: '2 min away',imagePath: 'assets/cars/Mercedes.jpeg'),
//                   CarListItem(carName: 'Audi S5', price: '\$2,810/day', timeAway: '5 min away',imagePath: 'assets/cars/Audi_S5.jpeg'),
//                   CarListItem(carName: 'Alfa Romeo F4', price: '\$2,810/day', timeAway: '5 min away',imagePath: 'assets/cars/Alfa_Romeo_F4.jpeg'),
//                   CarListItem(carName: 'Limousine', price: '\$2,810/day', timeAway: '10 min away',imagePath: 'assets/cars/Limousine.jpeg'),
//                   CarListItem(carName: 'Bentley', price: '\$2,810/day', timeAway: '12 min away',imagePath: 'assets/cars/Bentley.jpeg'),
//                 ],
//               ),
//          ),
          
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:kangaroo_customer_app/car_home_page.dart';
import 'package:kangaroo_customer_app/selected_car.dart';

class AllCarsSearch extends StatelessWidget {
  const AllCarsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // appBar: AppBar(
      //   title:  Text("All Cars", style:  textAlign.center),
      
      // ),
//       appBar: AppBar(
//   title: SizedBox(
//     width: double.infinity,
//     child: Text(
//       "All Cars ($cars.length())",
//       textAlign: TextAlign.center,
//     ),
//   ),
// ),
    appBar: AppBar(
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
          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.blueGrey),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Search Cars',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          
          // Grid View for Cars
          InkWell(
            // InkWell(

             onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const SelectedCar(),));
            },
            child: Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.8,
                ),
                itemCount: cars.length,
                itemBuilder: (context, index) => CarCard(car: cars[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Car Data Model
class Car {
  final String name;
  final String price;
  // final String timeAway;
  final String imagePath;

  const Car({
    required this.name,
    required this.price,
    // required this.timeAway,
    required this.imagePath,
  });
}

// Sample Data
const List<Car> cars = [
  Car(
    name: 'Audi R8',
    price: '\$1,120/day',
    // timeAway: '1 min away',
    imagePath: 'assets/cars/audi R8.jpeg',
  ),
  Car(
    name: 'Mercedes',
    price: '\$2,254/day',
    // timeAway: '2 min away',
    imagePath: 'assets/cars/Mercedes.jpeg',
  ),
  Car(
    name: 'Audi S5',
    price: '\$2,810/day',
    // timeAway: '5 min away',
    imagePath: 'assets/cars/Audi_S5.jpeg',
  ),
  Car(
    name: 'Alfa Romeo F4',
    price: '\$2,810/day',
    // timeAway: '5 min away',
    imagePath: 'assets/cars/Alfa_Romeo_F4.jpeg',
  ),
  Car(
    name: 'Limousine',
    price: '\$2,810/day',
    // timeAway: '10 min away',
    imagePath: 'assets/cars/Limousine.jpeg',
  ),
  Car(
    name: 'Bentley',
    price: '\$2,810/day',
    // timeAway: '12 min away',
    imagePath: 'assets/cars/Bentley.jpeg',
  ),
  Car(
    name: 'Audi R8',
    price: '\$1,120/day',
    // timeAway: '1 min away',
    imagePath: 'assets/cars/audi R8.jpeg',
  ),
  Car(
    name: 'Mercedes',
    price: '\$2,254/day',
    // timeAway: '2 min away',
    imagePath: 'assets/cars/Mercedes.jpeg',
  ),
  Car(
    name: 'Audi S5',
    price: '\$2,810/day',
    // timeAway: '5 min away',
    imagePath: 'assets/cars/Audi_S5.jpeg',
  ),
  Car(
    name: 'Alfa Romeo F4',
    price: '\$2,810/day',
    // timeAway: '5 min away',
    imagePath: 'assets/cars/Alfa_Romeo_F4.jpeg',
  ),
  Car(
    name: 'Limousine',
    price: '\$2,810/day',
    // timeAway: '10 min away',
    imagePath: 'assets/cars/Limousine.jpeg',
  ),
  Car(
    name: 'Bentley',
    price: '\$2,810/day',
    // timeAway: '12 min away',
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
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
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
                // const SizedBox(height: 4),
                // Row(
                //   children: [
                //     const Icon(Icons.access_time, size: 16),
                //     const SizedBox(width: 4),
                //     // Text(
                //     //   car.timeAway,
                //     //   style: TextStyle(
                //     //     fontSize: 14,
                //     //     color: Colors.grey[600],
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}