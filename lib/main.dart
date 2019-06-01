import 'package:flutter/material.dart';
// import 'package:mundoappto/pages/home.dart';
import 'package:mundoappto/pages/pruebaFirebase.dart';

<<<<<<< HEAD
// import 'card_page_dart.dart';

=======
>>>>>>> 8673d9058b071558ba503fa2ade667605c50f961
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
      home: PruebaFirebase(),
    );
  }
}