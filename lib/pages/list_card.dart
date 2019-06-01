import 'package:flutter/material.dart';
import 'package:mundoappto/models/ubicacion_model.dart';
import 'package:mundoappto/providers/listado_provider.dart';
//import 'package:geolocator/geolocator.dart';

import 'card_page_dart.dart';

class ListCard extends StatefulWidget {
  @override
  _ListaUbicacionesState createState() => _ListaUbicacionesState();
}

class _ListaUbicacionesState extends State<ListCard> {
  List<Ubicacion> _media = List();
  UbicacionProvider ubicacionProvider = new UbicacionProvider();
  @override
  void initState() {
    super.initState();
    loadUbicaciones();
  }
  // void didUpdateWidget(ListaUbicaciones oldWidget) {
  //   // if (oldWidget.provider != widget.provider){
  //     _media = List();
  //     setState(() {
  //       loadUbicaciones();
  //     });
  //   // }
  //   super.didUpdateWidget(oldWidget);
  // }

  void loadUbicaciones() async{
    //var _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    var media = await ubicacionProvider.getUbicaciones();
    //var media = await ubicacionProvider.getUbicacionesPorRadio(_position.latitude, _position.longitude, 0);
    setState(() { 
      _media.addAll(media); 
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media .length,
        itemBuilder: (context,index){
          return CardPage(ubicacion:_media[index]);
        },
      ),
    );
  }
}