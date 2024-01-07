import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  final List<Marker> _markers = <Marker>[];
  final List<LatLng> _latLng = [
    LatLng(3.0664778738744216, 101.59772394941416),
    LatLng(3.0671421090346653, 101.60236953509305),
    LatLng(3.0676027880163868, 101.59922598635423),
    LatLng(3.0633281079838053, 101.6026484848105),
    LatLng(3.063049556787987, 101.5978741530555),
    LatLng(3.061067555978396, 101.59833549297282),
  ];

  // list of text for info window
  final List<String> _infoWindowText = [
    'Sewage Drain',
    'Beachfront',
    'Tasik Kelana Square',
    'Sunway Geo Lake',
    'Sunway House Waterfront',
    'Sunway International School',
  ];

  // list of images for info window
  final List<String> _infoWindowImages = [
    'https://i.postimg.cc/66j3dRtc/dirty-beach.png',
    'https://i.postimg.cc/66j3dRtc/dirty-beach.png',
    'https://i.postimg.cc/66j3dRtc/dirty-beach.png',
    'https://i.postimg.cc/66j3dRtc/dirty-beach.png',
    'https://i.postimg.cc/66j3dRtc/dirty-beach.png',
    'https://i.postimg.cc/66j3dRtc/dirty-beach.png',
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFF1C1C1E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        // Left section of CustomInfoWindow
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey, width: 2),
                            image: DecorationImage(
                              image: Image.network(
                                      'https://i.postimg.cc/nhgGCFn2/taman-tasik-kelana.jpg')
                                  .image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        // Middle section of CustomInfoWindow
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        'Easy • ',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.green[600],
                                        size: 12,
                                      ),
                                      Text(
                                        ' 4.2(25)',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'Roboto',
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    _infoWindowText[i],
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          GoogleFonts.roboto().fontFamily,
                                    ),
                                  ),
                                  Text(
                                    'Persiaran Tasik Timur',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                  Text(
                                    '2.9 km - Est. 39m',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.9),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Roboto',
                                    ),
                                  ),
                                ]),
                          ),
                        ),

                        SizedBox(
                          width: 20,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            SizedBox(height: 10),
                            Icon(
                              Icons.bookmark,
                              color: Colors.white,
                              size: 24,
                            ),
                            SizedBox(height: 60),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                              size: 24,
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              _latLng[i],
            );
          },
        ),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1C1C1E),

      // set up google map
      body: Stack(
        children: [
          GoogleMap(
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

               Positioned(
          top: 0, // Set to 0 to start at the very top of the screen
          child: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, // Padding for status bar
              bottom: 8.0, // Additional padding at the bottom of the container
            ),
            width: MediaQuery.of(context).size.width, // Full width of the device
            color: Color(0xFF1C1C1E),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0), // Horizontal padding inside the search bar
                    decoration: BoxDecoration(
                      color: Colors.white, // Solid white background color for the search bar
                      borderRadius: BorderRadius.circular(30.0), // Rounded corners
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Space between search bar and button
                  ElevatedButton(
                    onPressed: () {
                      // Action when 'Create Ren' button is pressed
                    },
                    child: Text('Create Ren'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Solid background color for the button
                      onPrimary: Colors.white, // Text color for the button
                      shape: StadiumBorder(), // Rounded edges for the button
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          child: CustomInfoWindow(
              controller: _customInfoWindowController,
              height: 150,
              width: MediaQuery.of(context).size.width,
              offset: 50),
        ),
      ]),
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
