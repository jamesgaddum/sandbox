import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  
  GoogleMapController _mapController;
  BitmapDescriptor _mapIcon;

  final LatLng _center = const LatLng(-36.841738, 174.760004);

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size.square(5.0)), 'assets/pin_25x25.png').then((icon) {
      setState(() {
        _mapIcon = icon;
      });
    });
    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) async {
    _mapController = controller;
    _mapController.setMapStyle(await rootBundle.loadString('assets/map_style.json'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      body: Center(
        child: _mapIcon == null ? CircularProgressIndicator() : GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 16.5,
          ),
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          markers: _getMarkers(),
        ),
      ),
    );
  }

  Set<Marker> _getMarkers() {
    return Set<Marker>.from([Marker(
      markerId: MarkerId('Test'), 
      position: LatLng(-36.842750, 174.761570),
      icon: _mapIcon
    ),]);
  }
}