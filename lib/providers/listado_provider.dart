import 'dart:convert';
import '../models/ubicacion_model.dart';
//https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+PERU&key=AIzaSyBuKra5jDVBSEFRi1tlZ_Cww16AXebA0pc
import 'package:http/http.dart' as http;

class UbicacionProvider {
  String _url ="maps.googleapis.com";
  String _query="restaurants+in+PERU";
  String _key = "AIzaSyBuKra5jDVBSEFRi1tlZ_Cww16AXebA0pc";

  //List<Ubicacion> lista = [{""}]

  Future<List<Ubicacion>> getUbicaciones() async{
    final url = Uri.https(_url, "/maps/api/place/textsearch/json",{
      'query':_query,
      'key':_key
    });
    
      final resp = await http.get(url);
      print(resp);
      final decodeData = json.decode(resp.body);
      final ubicaciones = new Ubicaciones.fromJsonList(decodeData["results"]);

      
      return ubicaciones.items;
  }
}