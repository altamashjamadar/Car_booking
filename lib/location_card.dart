import 'package:flutter/material.dart';

class LocationCard extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback onTap;

  const LocationCard({
    super.key,
    required this.name,
    required this.address,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(address),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:kangaroo_customer_app/map_controller.dart';
// import 'package:kangaroo_customer_app/routes.dart';

// class LocationCard extends StatelessWidget {
//   final String name;
//   final String address;
//   final VoidCallback onTap;

//   const LocationCard({
//     super.key,
//     required this.name,
//     required this.address,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: InkWell(
//         onTap: (){
          
//     try {
//       if (Get.isRegistered<MapController>()) {
//         Get.toNamed(Routes.map);
//       } else {
//         Get.put(MapController());
//         Get.toNamed(Routes.map);
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Could not load map: $e');
//     }
  

//         },
        
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 address,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }