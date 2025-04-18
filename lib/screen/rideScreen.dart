import 'package:flutter/material.dart';


class Ride {
  final String rideDate;
  final String pickupLocation;
  final String dropOffLocation;
  final String fare;

  const Ride({
    required this.rideDate,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.fare,
  });
}

const List<Ride> rideHistory = [
  Ride(
    rideDate: 'Mar 15, 2025',
    pickupLocation: 'Hadapsar, Pune',
    dropOffLocation: 'Koregaon Park, Pune',
    fare: '\$12.50',
  ),
  Ride(
    rideDate: 'Mar 12, 2025',
    pickupLocation: 'Wakad, Pune',
    dropOffLocation: 'Magarpatta, Pune',
    fare: '\$15.75',
  ),
  Ride(
    rideDate: 'Mar 10, 2025',
    pickupLocation: 'FC Road, Pune',
    dropOffLocation: 'Baner, Pune',
    fare: '\$9.25',
  ),

];

class YourRidesScreen extends StatelessWidget {
  const YourRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Rides'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: rideHistory.isNotEmpty
          ? ListView.builder(
              itemCount: rideHistory.length,
              itemBuilder: (context, index) {
                final ride = rideHistory[index];
                return RideHistoryCard(ride: ride);
              },
            )
          : const Center(
              child: Text('No rides yet'),
            ),
    );
  }
}

class RideHistoryCard extends StatelessWidget {
  final Ride ride;

  const RideHistoryCard({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [const Color.fromARGB(255, 243, 255, 7), Colors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
      // color: Colors.amber,
      // elevation: 2,
      // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: const Icon(Icons.directions_car, size: 32, color: Colors.black54),
        title: Text(
          '${ride.pickupLocation} → ${ride.dropOffLocation}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            ride.rideDate,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
        trailing: Text(
          ride.fare,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        
      ),
    )
    );
  }
}
