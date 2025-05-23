import 'dart:developer';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustMapController extends GetxController {
  var markers = <Marker>[].obs;

  late GoogleMapController mapcontroller;

  void onMapCreated(GoogleMapController controller) {
    mapcontroller = controller;
  }

  //Marker code
  void addMarker(LatLng position) {
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId('current_marker'),
        position: position,
        infoWindow: InfoWindow(title: 'Current Location'),
      ),
    );
    mapcontroller.animateCamera(CameraUpdate.newLatLng(position));
  }

  Future<void> SearchandNavigate(String address) async {
    try {
      List<Location> location = await locationFromAddress(address);
      if (location.isNotEmpty) {
        Location locations = location.first;
        LatLng target = LatLng(locations.latitude, locations.longitude);
        addMarker(target);
        mapcontroller.animateCamera(CameraUpdate.newLatLngZoom(target, 14.0));
      }
    } catch (e) {
      log("Error Occured : $e");
    }
  }
}
