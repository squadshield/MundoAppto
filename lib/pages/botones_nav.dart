import 'package:flutter/material.dart';
 
 class Botones extends StatefulWidget {
   @override
   _BotonesState createState() => _BotonesState();
 }
 
 class _BotonesState extends State<Botones> {
   PageController _pagecontroller;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pagecontroller = PageController();
  }

  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
  body: Container(),
        bottomNavigationBar: BottomNavigationBar(
          items: _getFooterItems(),
          currentIndex: page,
          onTap: _navigationTapped,
        ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems(){
    return [ 
        BottomNavigationBarItem(
          icon: Icon(Icons.thumb_up),
          title: Text("Lugares")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.update),
          title: Text("Mapa")
        )
      
    ];
  }
  
  void _navigationTapped(int index){
    // _pagecontroller.animateToPage(page,
    //                               duration: const Duration(microseconds: 300),
    //                               curve: Curves.ease);
    setState(() {
      page= index;
    });
 }
 }