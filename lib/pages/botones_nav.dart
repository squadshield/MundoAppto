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

 /*
 class ListaUbicaciones extends StatefulWidget {
  @override
  _ListaUbicacionesState createState() => _ListaUbicacionesState();
}

class _ListaUbicacionesState extends State<ListaUbicaciones> {
  List<Ubicacion> _media = List();
  UbicacionProvider ubicacionProvider = new UbicacionProvider();
  @override
  void initState() {
    super.initState();
    loadUbicaciones();
  }
  // void didUpdateWidget(ListaUbicaciones oldWidget) {
  //   // if (oldWidget.provider != widget.provider){
  //     _media = List();
  //     setState(() {
  //       loadUbicaciones();
  //     });
  //   // }
  //   super.didUpdateWidget(oldWidget);
  // }

  void loadUbicaciones() async{
    var media = await ubicacionProvider.getUbicaciones();
    setState(() { 
      _media.addAll(media); 
    });
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _media .length,
        itemBuilder: (context,index){
          return UbicacionItem(ubicacion:_media[index]);
        },
      ),
    );
  }
}
*/ 