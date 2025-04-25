import 'package:flutter/material.dart';
import 'package:kangaroo_customer_app/UI/custom_Card.dart';

class SavedPlacesScreen extends StatelessWidget {
  SavedPlacesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Saved Places'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomCard(
        title: Text("Home"),
        subtitle: Text("123, ABC Street, City, Country"),
        leading: Icon(Icons.home),
            ),
            CustomCard(
        title: Text("Work"),
        subtitle: Text("456, DEF Avenue, City, Country"),
        leading: Icon(Icons.work),
            ),
            CustomCard(
        title: Text("Gym"),
        subtitle: Text("789, Fitness Road, City, Country"),
        leading: Icon(Icons.fitness_center),
            ),
            CustomCard(
        title: Text("Favorite"),
        subtitle: Text("Some Favorite Place, City, Country"),
        leading: Icon(Icons.star),
            ),
            
          ],
        ),
      ),
     
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          // Add navigation or functionality for adding a new saved place.
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}

