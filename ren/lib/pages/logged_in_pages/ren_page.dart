import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng monashLocation = LatLng(3.0650, 101.6009);

class RenPage extends StatefulWidget {
  const RenPage({Key? key}) : super(key: key);

  @override
  State<RenPage> createState() => _RenPageState();
}

class _RenPageState extends State<RenPage> {
  // onMapCreated callback provides us with a controller that we can use to interact with the map, so I will use this thingy to play with the mapzzz hehe
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),

      // set up google map
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: monashLocation,
          zoom: 14,
        ),

        // set up controller
        onMapCreated: (controller) {
          mapController = controller;
          addMarker('test', monashLocation);
        },

        markers: _markers.values.toSet(),

        // markers: {
        //   Marker(
        //     markerId: MarkerId('Monash Uni Malaysia'),
        //     position: monashLocation,
        //   )
        // },
      ),
    );
  }

  // add marker method
  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 
        'lib/images/ren_logo_marker.png'
        );

    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
          title: 'Monash University Malaysia',
          snippet: 'Jalan Lagoon Selatan, 47500 Bandar Sunway, Selangor',
        ),
        icon: markerIcon
        
        );

    _markers[id] = marker;

    setState(() {});
  }
}
