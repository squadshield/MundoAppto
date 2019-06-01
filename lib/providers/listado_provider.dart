import 'dart:async';
import 'dart:convert';
import '../models/ubicacion_model.dart';
import '../models/lugares_model.dart';
//https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+PERU&key=AIzaSyBuKra5jDVBSEFRi1tlZ_Cww16AXebA0pc
import 'package:http/http.dart' as http;
//import 'lugares_provider.dart';

class UbicacionProvider {
  String _url ="maps.googleapis.com";
  String _query="restaurants+in+PERU";
  String _key = "AIzaSyBuKra5jDVBSEFRi1tlZ_Cww16AXebA0pc";

  Future<List<Ubicacion>> getUbicaciones() async{
    final url = Uri.https(_url, "/maps/api/place/textsearch/json",{
      'query':_query,
      'key':_key
    });
    
      final resp = await http.get(url);
      print(resp);
      final decodeData = json.decode(resp.body);
      final ubicaciones = new Ubicaciones.fromJsonList(decodeData["results"]);
      List<Ubicacion> lista = ubicaciones.items;
      List<Lugares> listaLugares = new List<Lugares>();
      //var objeto = await getCollectionLugares();

  //objeto = objeto;
// this.service.getListado(this.rncModel).then(result => {
//       let listaRnc = result.map(item => {
//         return {
//           $key: item.key,
//           ...item.payload.doc.data()
//         };
//       });


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