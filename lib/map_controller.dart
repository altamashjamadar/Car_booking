// map_controller.dart
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  final Rx<LatLng> center = const LatLng(37.7749, -122.4194).obs;
  final markers = <Marker>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMarkers();
  }

  void loadMarkers() {
    markers.add(
      Marker(
        markerId: const MarkerId('current_location'),
        position: center.value,
        infoWindow: const InfoWindow(title: 'Your Location'),
      ),
    );
  }
}