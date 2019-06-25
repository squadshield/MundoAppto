import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mundoappto/models/ubicacion_model.dart';
import '../providers/listado_provider.dart';
import 'package:geolocator/geolocator.dart';

import 'card_page_dart.dart';

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
   final double _zoom = 17.5;
   static CameraPosition miUbicacion = CameraPosition(
     target: LatLng(-12.13556, -77.0223224),
     zoom: 15,
   ); 
  @override
  void initState() {    
    super.initState();  
    loadUbicaciones();
    obtenerMiPosicion();
  }
  MarkerId selectedMarker;
  int valor=0;
  int numeracion = 0;
   String markerNom="App";
  @override
  Widget build(BuildContext context) {
          _createMarkerImageFromAsset(context);      
          final ScreenArguments args = ModalRoute.of(context).settings.arguments;
          if(args!=null){
            valor=  int.parse(args.message);
          }
    return Scaffold(
      appBar: valor==0?null:AppBar(),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:miUbicacion,
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
            backgroundColor:  Theme.of(context).primaryColor,
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

  void obtenerMiPosicion() async {
    var _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      miUbicacion = CameraPosition(
        target: LatLng(_position.latitude,_position.longitude),
        zoom: 18.5,
      );
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