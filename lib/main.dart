import 'package:flutter/material.dart';
import 'package:mundoappto/pages/home.dart';
<<<<<<< HEAD
// import 'package:mundoappto/pages/home.dart';
import 'package:mundoappto/pages/pruebaFirebase.dart';
=======
//import 'package:mundoappto/pages/pruebaFirebase.dart';
>>>>>>> 22a712f504f299afcdc2e25aff49cacf8696bebf

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MundoAppto",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.yellow),
      home: Home(),//PruebaFirebase(),
    );
  }
}