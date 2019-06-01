import 'package:flutter/material.dart';
<<<<<<< HEAD
//import 'package:mundoappto/pages/home.dart';
import 'package:mundoappto/pages/pruebaFirebase.dart';

=======
import 'package:mundoappto/pages/home.dart';
>>>>>>> b34efa2112af65afcb4d6756f0efa85fa94cac76
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
<<<<<<< HEAD
      theme: ThemeData(primaryColor: Colors.yellow),
      home: PruebaFirebase(),
=======
      theme: ThemeData(primaryColor: Colors.green),
      home: Home(),//PruebaFirebase(),
>>>>>>> b34efa2112af65afcb4d6756f0efa85fa94cac76
    );
  }
}