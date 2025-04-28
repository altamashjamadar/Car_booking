
import 'package:flutter/material.dart';
class Ride {
  final String rideType;
  final String rideId;
  final String carModel;
  final int fare;
  final String pickupLocation;
  final String dropoffLocation;
  final String pickupTime;
  final String dropoffTime;
  final String date;
  final String status;

  const Ride({
    required this.rideType,
    required this.rideId,
    required this.carModel,
    required this.fare,
    required this.pickupLocation,
    required this.dropoffLocation,
    required this.pickupTime,
    required this.dropoffTime,
    required this.date,
    required this.status,
  });
}

final List<Ride> rideHistory = [
  Ride(
    rideType: 'Premium Cab Ride',
    rideId: '81324',
    carModel: 'Audi R8',
    fare: 20,
    pickupLocation: 'RamTekdi',
    dropoffLocation: 'Railway Station',
    pickupTime: '11:35',
    dropoffTime: '13:15',
    date: '2025-03-04',
    status: 'Completed',
  ),
  Ride(
    rideType: 'Premium Cab Ride',
    rideId: '19870',
    carModel: 'Audi S5',
    fare: 20,
    pickupLocation: 'Magarpatta',
    dropoffLocation: 'Kondwa',
    pickupTime: '09:15',
    dropoffTime: '10:15',
    date: '2025-04-14',
    status: 'Cancelled',
  ),
  Ride(
    rideType: 'Premium Cab Ride',
    rideId: '20214',
    carModel: 'Bently',
    fare: 30,
    pickupLocation: 'Hadapsar',
    dropoffLocation: 'Airport',
    pickupTime: '16:45',
    dropoffTime: '17:00',
    date: '2025-02-20',
    status: 'Completed',
  ),

];

class YourRidesScreen extends StatelessWidget {
  const YourRidesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text('Your Rides', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rideHistory.length,
        itemBuilder: (context, index) {
          return RideCard(ride: rideHistory[index]);
        },
      ),
    );
  }
}

class RideCard extends StatelessWidget {
  final Ride ride;
  static const _accentColor = Color(0xFFFFA000);

  const RideCard({Key? key, required this.ride}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFCCFF00), Color(0xFFFF8C00)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/logo.jpeg',
                    height: 24,
                    width: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ride.rideType,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                Text(
                  ride.rideId,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.directions_car, color: Colors.black54, size: 20),
                      const SizedBox(width: 8),
                      Text(
                        ride.carModel,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Text(
                    '\$${ride.fare}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const Icon(Icons.radio_button_checked, size: 20, color: _accentColor),
                    Container(width: 2, height: 30, color: _accentColor),
                    const Icon(Icons.location_on, size: 20, color: _accentColor),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ride.pickupLocation, style: const TextStyle(fontSize: 15)),
                      const SizedBox(height: 4),
                      Text(ride.dropoffLocation, style: const TextStyle(fontSize: 15)),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(ride.pickupTime, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                    const SizedBox(height: 16),
                    Text(ride.dropoffTime, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          Container(
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: Colors.black54),
                const SizedBox(width: 8),
                Text(ride.date, style: const TextStyle(fontSize: 14)),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: _accentColor),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(ride.status, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
