import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mundoappto/models/lugares_model.dart';
//import 'package:mundoappto/models/ubicacion_model.dart';

//método para listar los lugares
Future <List<Lugares>> getCollectionLugares() async{

    List<DocumentSnapshot> templist;
    CollectionReference collectionRef = Firestore.instance.collection("lugares");
    QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    var lugaresFireBase = templist.map((doc) => fromFirestore(doc)).toList();

    return lugaresFireBase;
  }

 Lugares fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    Lugares lis = new Lugares();

    lis.comentario = data['comentario'] ?? '';
    lis.descripcion = data['descripcion'] ?? '';
    lis.idMaps = data['idMaps'] ?? '';
    lis.lng = data['lng'] ?? '';
    lis.lat = data['lat'] ?? '';
    lis.nombre = data['nombre'] ?? '';
    lis.ranking = data['ranking'] ?? '';
    lis.ubicacion = data['ubicacion'] ?? '';

    return lis;
  }

// Future <List<Lugares>> getCollectionLugaresID() async{
    
//     var data = new List<Lugares>();

//      CollectionReference collectionRef = Firestore.instance.collection("lugares");
//     QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

//     var templist = collectionSnapshot.documents;

//     // for (var item in templist) {
      
      
      

//     // }

//     return data;
// }