import 'package:flutter/material.dart';

import 'list_card.dart';
import 'mapa.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
  
class _HomeState extends State<Home> {
  PageController _pagecontroller;
  int page = 0;
  final List<Widget> _listWidget=[
    ListCard(),
    MapSample()
  ];
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
      appBar: AppBar(
       title: Text("MundoAppto"),
      ),
        body: _listWidget[page],      
      bottomNavigationBar: BottomNavigationBar(
          items: _getFooterItems(),
          currentIndex: page,
          onTap: _navigationTapped,
        )
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