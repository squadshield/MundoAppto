import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PruebaFirebase extends StatefulWidget {
  @override
  _PruebaFirebaseState createState() => _PruebaFirebaseState();
}

class _PruebaFirebaseState extends State<PruebaFirebase> {
  @override
  Widget build(BuildContext context) {
    var data = Firestore.instance.collection('usuarios').snapshots();
    return Scaffold(
       appBar: AppBar(
       title: Text("PRUEBA FIREBASE"),
      ),
      body:Container(child: Text(data.first.toString())),
    );
  }
}