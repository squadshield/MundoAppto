import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PruebaFirebase extends StatefulWidget {
  @override
  _PruebaFirebaseState createState() => _PruebaFirebaseState();
}

class _PruebaFirebaseState extends State<PruebaFirebase> {
  @override
  void initState() {
    getCollection();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
       appBar: AppBar(
       title: Text("PRUEBA FIREBASE"),
      ),
      body:Container(child: Text("")),
    );
  }

  // String datos (){
  //   String data ="";
  //     for (var item in getCollection()) {
  //       data = item.toString();  
  //     }       
     
  //   return data;
  // }
  Future <List<Map<dynamic, dynamic>>> getCollection() async{
  List<DocumentSnapshot> templist;
  List<Map<dynamic, dynamic>> list = new List();
  CollectionReference collectionRef = Firestore.instance.collection("usuarios");
  QuerySnapshot collectionSnapshot = await collectionRef.getDocuments();

  templist = collectionSnapshot.documents; // <--- ERROR

  list = templist.map((DocumentSnapshot docSnapshot){
    return docSnapshot.data;
  }).toList();
    print(list);
  return list;
  }  

}