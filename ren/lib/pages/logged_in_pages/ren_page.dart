import 'package:custom_info_window/custom_info_window.dart';
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


  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  
  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLng = [
    LatLng(3.0664778738744216, 101.59772394941416),
    LatLng(3.0671421090346653, 101.60236953509305),
    LatLng(3.0676027880163868, 101.59922598635423),
    LatLng(3.0633281079838053, 101.6026484848105),
    LatLng(3.063049556787987, 101.5978741530555),
    LatLng(3.061067555978396, 101.59833549297282),
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData();
  }

  // load data of markers
  void _loadData() async {
    for (int i = 0; i < _latLng.length; i++) {
      _markers.add(
        Marker(
          markerId: MarkerId(_latLng[i].toString()),
          icon: await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'lib/images/ren_logo_marker.png'),
        position: _latLng[i],

        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                color: Color(0xFF1C1C1E),
                borderRadius: BorderRadius.circular(10),
              ),
              child:  Column(
                children: [
                  Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2),
                      image: DecorationImage(
                        image: Image.network('https://i.postimg.cc/66j3dRtc/dirty-beach.png').image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Naka\'s Beach',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ),


            _latLng[i],
          );
        },


        ),
      );

      setState(() {


      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),

      // set up google map
      body: Stack(
        children: [GoogleMap(
          initialCameraPosition: CameraPosition(
            target: monashLocation,
            zoom: 15,
          ),
        
          // set up markers
          markers: Set<Marker>.of(_markers),
        
          // on tap marker
          onTap: (position) {
            _customInfoWindowController.hideInfoWindow!();
          },

          // on camera move
          onCameraMove: (position) {
            _customInfoWindowController.onCameraMove!();
          },
        
        
          // set up controller
          onMapCreated: (controller) {
            mapController = controller;
            _customInfoWindowController.googleMapController = controller;
          },
        
        
        
        ),
        
      CustomInfoWindow(
        controller: _customInfoWindowController,
        height: 150,
        width: 200,
        offset: 50,
      ),

        ]
      ),

    );
  }

  // add marker method
  addMarker(String id, LatLng location) async {
    var markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'lib/images/ren_logo_marker.png');

    var marker = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: InfoWindow(
          title: 'Monash University Malaysia',
          snippet: 'Jalan Lagoon Selatan, 47500 Bandar Sunway, Selangor',
        ),
        icon: markerIcon);

    // _markers[id] = marker;

    setState(() {});
  }
}
