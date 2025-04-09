import 'package:flutter/material.dart';
import 'package:kangaroo_customer_app/car_selection_screen.dart';

class YourRouteScreen extends StatefulWidget {
  const YourRouteScreen({Key? key}) : super(key: key);

  @override
  State<YourRouteScreen> createState() => _YourRouteScreenState();
}

class _YourRouteScreenState extends State<YourRouteScreen> {
  // Controllers for the text fields
  final TextEditingController _pickupController =
      TextEditingController(text: '');
  final TextEditingController _destinationController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // White background to match the style in your screenshot
      backgroundColor: Colors.white,

      // AppBar with a back arrow and centered title
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Your Route',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      // Main body
      body: Column(
        children: [
          // Top container for pickup & destination
          Container(
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                // Pickup Row
                Row(
                  children: [
                    // Colored dot or icon for pickup
                    Container(
                      width: 14,
                      height: 14,
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Pickup TextField
                    Expanded(
                      child: TextField(
                        controller: _pickupController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Pick-up location',
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),

                // Divider
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 1,
                  color: Colors.grey[300],
                ),

                // Destination Row
                Row(
                  children: [
                    // Colored dot or icon for destination
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Destination TextField
                    Expanded(
                      child: TextField(
                        controller: _destinationController,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Destination',
                        ),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    // Clear button (only if there's text)
                    if (_destinationController.text.isNotEmpty)
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _destinationController.clear();
                          });
                        },
                        child:
                            const Icon(Icons.close, color: Colors.grey, size: 20),
                      ),
                    const SizedBox(width: 12),
                    // Swap button to flip pickup & destination
                    GestureDetector(
                      onTap: () {
                        final temp = _pickupController.text;
                        setState(() {
                          _pickupController.text = _destinationController.text;
                          _destinationController.text = temp;
                        });
                      },
                      child: const Icon(Icons.swap_vert, color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // List of suggested or nearby places
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                SuggestedLocation(
//                            onTap: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context) => const YourRouteScreen()),
                      
// );
//                     },
                  // onTap: CarSelectionScreen,
                  
                  title: ' Alacritys',
                  address: 'lane no 4,Phase 1, Indraprashtha Society, Hadapsar, Pune,Maharastra',
                ),
                SuggestedLocation(
                  title: 'Gangotri Park',
                  address: 'satawadi ,hadapsar,Pune,Maharastra',
                ),
                SuggestedLocation(
                  title: 'Pune SEO Company',
                  address: '2nd Lane,Amar Srushti,Hadapsar,Pune,Maharastra',
                ),
                SuggestedLocation(
                  title: 'Amanora Mall',
                  address: 'Kharadi Rd,Amanora Park Town,Pune,Maharastra',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Example item for suggested/nearby location
class SuggestedLocation extends StatelessWidget {
  final String title;
  final String address;

  const SuggestedLocation({
    Key? key,
    required this.title,
    required this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.grey[200],
        ),
        child: const Icon(Icons.location_on, color: Colors.blue),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(address),
      onTap: () {
        // Handle location item tap
        // e.g., set it as the destination, or dismiss the screen
            // onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CarSelectionScreen()),);                 // };
      },
    );
  }
}
