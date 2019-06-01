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

  //método para listar los lugares, se puede aplicar filtros
Future <List<Map<dynamic, dynamic>>> getCollectionLugaresID(String id) async{

    List<DocumentSnapshot> templist;
    List<Map<dynamic, dynamic>> list = new List();

    CollectionReference collectionRef = Firestore.instance.collection("lugares");
    QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

    templist = collectionSnapshot.documents; // <--- ERROR

    list = templist.map((DocumentSnapshot docSnapshot){
      return docSnapshot.data;
    }).toList();
     print(list);
    return list;
  }