import 'dart:async';
import 'dart:convert';
import '../models/ubicacion_model.dart';
import '../models/lugares_model.dart';
//https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+PERU&key=AIzaSyBuKra5jDVBSEFRi1tlZ_Cww16AXebA0pc
import 'package:http/http.dart' as http;
import 'lugares_provider.dart';

class UbicacionProvider {
  String _url ="maps.googleapis.com";
  String _query="restaurants+in+PERU";
  String _key = "AIzaSyBuKra5jDVBSEFRi1tlZ_Cww16AXebA0pc";

  // double _latitude = -12.13553;
  // double _longitude = -77.0223006;
  // double _radius = 5000;


  Future<List<Ubicacion>> getUbicaciones() async{
    final url = Uri.https(_url, "/maps/api/place/textsearch/json",{
      'query':_query,
      'key':_key
    });
    
      final resp = await http.get(url);
      final decodeData = json.decode(resp.body);
      final ubicaciones = new Ubicaciones.fromJsonList(decodeData["results"]);
      List<Ubicacion> lista = ubicaciones.items;

      List<Lugares> listaLugares = await getCollectionLugares();

       for(var i = 0; i < lista.length; i++){
        var loc = lista[i].id;
        for(var tec = 0; tec < listaLugares.length; tec++){
          if (listaLugares[tec].idMaps == loc){
            lista[i].comentario = listaLugares[tec].comentario;
            lista[i].descripcion = listaLugares[tec].descripcion;
            lista[i].lng = listaLugares[tec].lng;
            lista[i].lat = listaLugares[tec].lat;
            lista[i].nombre = listaLugares[tec].nombre;
            lista[i].ranking = listaLugares[tec].ranking;
            lista[i].ubicacion = listaLugares[tec].ubicacion;
          }          
        }
     }      
      return lista;
  }

  Future<List<Ubicacion>> getUbicacionesPorRadio(double _latitude, double _longitude, double _radius) async{

    _latitude = _latitude;
    _longitude = _longitude;
    _radius = 500;

    final url = Uri.https(_url, "/maps/api/place/nearbysearch/json",{
      'location':_latitude.toString() + ","  + _longitude.toString(),
      'radius': _radius.toString(),
      'key':_key
    });
    
      final resp = await http.get(url);
      print(resp);
     
      final decodeData = json.decode(resp.body);
      final ubicaciones = new Ubicaciones.fromJsonList(decodeData["results"]);
      List<Ubicacion> lista = ubicaciones.items;
      List<Lugares> listaLugares = new List<Lugares>();

       for(var i = 0; i < lista.length; i++){
        var loc = lista[i].id;
        for(var tec = 0; tec < listaLugares.length; tec++){
          if (listaLugares[tec].idMaps == loc){
            lista[i].comentario = listaLugares[tec].comentario;
            lista[i].descripcion = listaLugares[tec].descripcion;
            lista[i].lng = listaLugares[tec].lng;
            lista[i].lat = listaLugares[tec].lat;
            lista[i].nombre = listaLugares[tec].nombre;
            lista[i].ranking = listaLugares[tec].ranking;
            lista[i].ubicacion = listaLugares[tec].ubicacion;
          }          
        }
     }      
      return lista;
  }
}