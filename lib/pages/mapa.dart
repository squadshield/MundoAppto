import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import '../providers/listado_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      home: MapSample(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  BitmapDescriptor _markerIcon;
  final Set<Marker> _markers = Set();
   final double _zoom = 10;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(-11.9959467, -77.0088999),
    zoom: 10,
  );
  var miUbicacion = LatLng(-11.9959467, -77.0088999);
  var miUbicacion2 = LatLng(-12.9959467, -77.0088999);
  static final LatLng center = const LatLng(-33.86711, 151.1947171);
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(-11.9959467, -77.0088999),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  MarkerId selectedMarker;
  int numeracion = 0;
   String markerNom="Peru";
  @override
  Widget build(BuildContext context) {
          _createMarkerImageFromAsset(context);      
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        onTap:(context) async {
            
            numeracion ++;
            String id =markerNom +numeracion.toString();
            final GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newLatLngZoom(context, _zoom));
            setState(() {
              // _markers.clear();
              _markers.add(
                Marker(
                    markerId: MarkerId(id),
                    position: context,
                    icon: _markerIcon,
                    infoWindow: InfoWindow(title: id,  snippet: id)),
              );
            });
        },        
        markers:_markers,
      );
  }
   Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    if (_markerIcon == null) {
      final ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context);
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, 'assets/flags.png')
          .then(_updateBitmap);
    }
  }
  void _updateBitmap(BitmapDescriptor bitmap) {
    setState(() {
      _markerIcon = bitmap;
    });
  }
  
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    //var lista = UbicacionProvider().getUbicaciones();
    //lista = lista;
  }
}