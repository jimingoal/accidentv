import 'dart:async';

import 'package:accidentv/widgets/multi_select_chip.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  MapType _currentMapType = MapType.normal;

  static const LatLng _center = const LatLng(37.578801, 127.089973);

  List<bool> isSelected = List.generate(4, (_) => false);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    LocationData currentLocation;
    var location = new Location();
    try {
      currentLocation = await location.getLocation();
    } on Exception {
      currentLocation = null;
    }

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(currentLocation.latitude, currentLocation.longitude),
        zoom: 17.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 15.0,
            ),
            mapType: _currentMapType,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.menu,
                  size: 35,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _currentMapType = _currentMapType == MapType.normal
                        ? MapType.satellite
                        : MapType.normal;
                  });
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.lightBlue,
                child: const Icon(Icons.map, size: 36.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150, right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: _currentLocation,
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.lightBlue,
                child: const Icon(Icons.location_on, size: 36.0),
              ),
            ),
          ),
          Positioned(
              bottom: 100,
              child: MultiSelectChip()),
          // Positioned(
          //   left: 20,
          //   bottom: 50,
          //   child: ToggleButtons(
          //     // selectedBorderColor: Colors.lightBlue,
          //     renderBorder: false,
          //     selectedColor: Colors.black26,
          //     disabledColor: Colors.black26,
          //     children: <Widget>[
          //       Container(
          //         alignment: Alignment.center,
          //         width: 80,
          //         child: FaIcon(
          //           FontAwesomeIcons.tools,
          //           size: 25.0,
          //         ),
          //       ),
          //       Container(
          //         width: 80,
          //         child: FaIcon(
          //           FontAwesomeIcons.tools,
          //           size: 25.0,
          //         ),
          //       ),
          //       Container(
          //         width: 80,
          //         child: FaIcon(
          //           FontAwesomeIcons.tools,
          //           size: 25.0,
          //         ),
          //       ),
          //       Container(
          //         width: 80,
          //         child: FaIcon(
          //           FontAwesomeIcons.tools,
          //           size: 25.0,
          //         ),
          //       ),
          //     ],
          //     onPressed: (int index) {
          //       int count = 0;
          //       isSelected.forEach((bool val) {
          //         if (val) count++;
          //       });
          //
          //       if (isSelected[index] && count < 2) return;
          //
          //       setState(() {
          //         isSelected[index] = !isSelected[index];
          //       });
          //     },
          //     isSelected: isSelected,
          //   ),
          // ),
          // Positioned(
          //   left: 10,
          //   bottom: 50,
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.lightBlue,
          //     onPressed: () {},
          //     child: FaIcon(
          //       FontAwesomeIcons.tools,
          //       size: 25.0,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 110,
          //   bottom: 50,
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.lightBlue,
          //     onPressed: () {},
          //     child: FaIcon(
          //       FontAwesomeIcons.exclamationTriangle,
          //       size: 25.0,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 210,
          //   bottom: 50,
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.lightBlue,
          //
          //     onPressed: () {},
          //     child: ImageIcon(
          //       AssetImage('assets/cctv.png'),
          //       size: 80,
          //     ),
          //     // Image.asset('assets/cctv.png'),
          //   ),
          // ),
          // Positioned(
          //   left: 310,
          //   bottom: 50,
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.lightBlue,
          //     onPressed: () {},
          //     child: FaIcon(
          //       FontAwesomeIcons.edit,
          //       size: 25.0,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
