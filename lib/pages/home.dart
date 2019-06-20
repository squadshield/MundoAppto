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

  // Choice _selectedChoice = choices[0]; // The app's "state".
  void _select(Choice choice) {
    // Causes the app to rebuild with the new _selectedChoice.
    setState(() {
      // _selectedChoice = choice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("MundoAppto"),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(choices[0].icon),
              onPressed: () {
                _select(choices[0]);
              },
            ),
            // action button
            IconButton(
              icon: Icon(choices[1].icon),
              onPressed: () {
                _select(choices[1]);
              },
            ),
            // overflow menu
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.skip(2).map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
        ),
      
        body: _listWidget[page],      
      bottomNavigationBar: BottomNavigationBar(
          items: _getFooterItems(),
          currentIndex: page,
          onTap: _navigationTapped,
          backgroundColor: Theme.of(context).primaryColorLight,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
        )
    );
  }


  List<BottomNavigationBarItem> _getFooterItems(){
    return [ 
        BottomNavigationBarItem(
          icon: Icon(Icons.location_city,size: 30),
          title: Text("Lugares")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on,size: 30),
          title: Text("Mapas"),
          backgroundColor: Colors.red
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

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Silla Ruedas', icon: IconData(59668, fontFamily: 'MaterialIcons')),
  const Choice(title: 'Discapacidad visual', icon: Icons.remove_red_eye),
  const Choice(title: 'Movilidad Reducida', icon: Icons.directions_boat),
  const Choice(title: 'Discapacidad Auditiva', icon: Icons.directions_bus)
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}