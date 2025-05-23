import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ovodrive_app/controllers/cust_map_controller.dart';

class CustMapPage extends StatefulWidget {
  const CustMapPage({super.key});

  @override
  State<CustMapPage> createState() => _CustMapPageState();
}

class _CustMapPageState extends State<CustMapPage> {
  @override
  Widget build(BuildContext context) {
    final CustMapController mapController = CustMapController();
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(30.3753, 69.3451),
        zoom: 5,
      ),
      onMapCreated: mapController.onMapCreated,
      markers: mapController.markers.toSet(),
      onTap: (position) {
        mapController.addMarker(position);
      },
    );
  }
}
