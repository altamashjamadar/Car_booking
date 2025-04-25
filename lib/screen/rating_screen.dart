
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kangaroo_customer_app/screen/feedback.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({Key? key}) : super(key: key);

  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  final LatLng _start = const LatLng(18.500115, 73.949802);
  final LatLng _end   = const LatLng(18.51927,  73.933000);
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: Stack(
        children: [
 
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2.5),
                      ),
                    ),
                  ),

                 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Last Trip',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () => print('Need help?'),
                        child: const Text('Need help?',style: TextStyle(
                          color: Colors.black
                        ),),
                      ),
                    ],
                  ),

           
                  const Text(
                    'Thursday, 10:15 am',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      height: 180,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: _start,
                          zoom: 14,
                        ),
                        markers: {
                          Marker(markerId: const MarkerId('start2'), position: _start),
                          Marker(markerId: const MarkerId('end2'),   position: _end),
                        },
                        polylines: {
                          Polyline(
                            polylineId: const PolylineId('route2'),
                            color: Colors.orange,
                            width: 4,
                            points: [_start, _end],
                          ),
                        },
                        onMapCreated: (c) {},
                        zoomControlsEnabled: false,
                        scrollGesturesEnabled: false,
                        tiltGesturesEnabled: false,
                        rotateGesturesEnabled: false,
                        myLocationButtonEnabled: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

               
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage('assets/user_image.jpeg'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Mike Marco',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('Kangaroo Cars', style: TextStyle(color: Colors.black54)),
                            ],
                          ),
                        ),
                        const Text(
                          '\$254.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

             
                  const Center(
                    child: Text(
                      'Rate Your Trip',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 12),

              
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (i) {
                      return IconButton(
                        icon: Icon(
                          i < _rating ? Icons.star : Icons.star_border,
                          size: 32,
                          color: Colors.orange,
                        ),
                        onPressed: () => setState(() {
                          _rating = i + 1;
                        }),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),

          
                  ElevatedButton(
                    onPressed: () {
                      print('Rated $_rating stars');
                      Get.to(FeedbackForm());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
