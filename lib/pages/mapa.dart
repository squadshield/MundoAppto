import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mundoappto/models/ubicacion_model.dart';
import '../providers/listado_provider.dart';
import 'package:geolocator/geolocator.dart';
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
  UbicacionProvider ubicacionProvider = new UbicacionProvider();
   Position position;

   List<Ubicacion> _media = List();
   
  @override
  void initState() {    
    super.initState();  
    loadUbicaciones();
  }

  
  final double _zoom = 17.5;
  static final CameraPosition miUbicacion = CameraPosition(
    target: LatLng(-12.13556, -77.0223224),
    zoom: 15,
  );
  MarkerId selectedMarker;
  int numeracion = 0;
   String markerNom="App";
  @override
  Widget build(BuildContext context) {
          _createMarkerImageFromAsset(context);      
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: miUbicacion,
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
      )
      ,floatingActionButton: FloatingActionButton(
            onPressed: () {
              _goToTheLake();
            },
            child: Icon(Icons.location_on,),
            foregroundColor: Colors.white,
            backgroundColor: Colors.green,
          ));

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
    var _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: LatLng(_position.latitude,_position.longitude),
                      zoom: 18.5,
                    )));
  }
  void test()  {
    // final GoogleMapController controller = await _controller.future;
    // controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    var lista = UbicacionProvider().getUbicaciones();
    lista = lista;
  }  

  void loadUbicaciones() async{
    var media = await ubicacionProvider.getUbicaciones();
    setState(() { 
      _media.addAll(media);  
      for (var item in media) {
        _markers.add(
                    Marker(
                        markerId: MarkerId(item.hashCode.toString()),
                        position:  LatLng(item.geometry.location.lat,item.geometry.location.lng),
                        icon: _markerIcon,
                        infoWindow: InfoWindow(title: item.name,  snippet: item.formattedAddress??"")),
                  );
      }
    });
  }
}