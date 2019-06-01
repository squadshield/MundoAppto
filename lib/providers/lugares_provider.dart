 import 'package:cloud_firestore/cloud_firestore.dart';
 import 'package:mundoappto/models/lugares_model.dart';

var lugarModel = new Lugares();

//método para listar los lugares
Future <List<Map<dynamic, dynamic>>> getCollectionLugares() async{

    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();

    CollectionReference collectionRef = Firestore.instance.collection("lugares");
    QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot){
      return docSnapshot.data;
    }).toList();

    return list;
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