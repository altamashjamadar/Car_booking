import 'package:flutter/material.dart';

class SavedPlacesScreen extends StatelessWidget {
  SavedPlacesScreen({Key? key}) : super(key: key);

  final List<SavedPlace> savedPlaces = const [
    SavedPlace(
      title: 'Home',
      address: '123, ABC Street, City, Country',
      icon: Icons.home,
    ),
    SavedPlace(
      title: 'Work',
      address: '456, DEF Avenue, City, Country',
      icon: Icons.work,
    ),
    SavedPlace(
      title: 'Gym',
      address: '789, Fitness Road, City, Country',
      icon: Icons.fitness_center,
    ),
    SavedPlace(
      title: 'Favorites',
      address: 'Some Favorite Place, City, Country',
      icon: Icons.star,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Places'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: savedPlaces.length,
        itemBuilder: (context, index) {
          return SavedPlaceCard(place: savedPlaces[index]);
        },
      ),
      // Floating action button for adding a new saved place.
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87,
        onPressed: () {
          // Add navigation or functionality for adding a new saved place.
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SavedPlace {
  final String title;
  final String address;
  final IconData icon;

  const SavedPlace({
    required this.title,
    required this.address,
    required this.icon,
  });
}

class SavedPlaceCard extends StatelessWidget {
  final SavedPlace place;

  const SavedPlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          place.icon,
          size: 32,
          color: Colors.black54,
        ),
        title: Text(
          place.title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          place.address,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          // On tap functionality, e.g., navigate to details screen.
        },
      ),
    );
  }
}
