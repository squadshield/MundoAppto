import 'package:flutter/material.dart';
import 'package:mundoappto/models/ubicacion_model.dart';

class CardPage extends StatelessWidget {
  final Ubicacion ubicacion;
  CardPage({this.ubicacion});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Container(
            child:Stack(
              children: <Widget>[
                Image.network("https://www.laespanolaaceites.com/uploads/recetas/fotos/pizza-con-chorizo-jamon-y-queso.jpg"),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[900].withOpacity(0.5)
                    ),
                    constraints: BoxConstraints.expand(
                      height: 55.0
                    ),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Bembos Miraflores",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "Generos..",
                          // media.getGenres(),
                          style: TextStyle(
                            color: Colors.white
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 5.0,
                  bottom: 12,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text("Votos"),
                          Container(width: 4.0,),
                          Icon(Icons.star,
                               color: Colors.white,
                               size: 16.0),
                               Icon(Icons.star,
                               color: Colors.white,
                               size: 16.0),
                               Icon(Icons.star,
                               color: Colors.white,
                               size: 16.0),
                               Icon(Icons.star,
                               color: Colors.white,
                               size: 16.0),
                        ],
                      ),
                      Container(
                        height: 4.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text( "Texto"),
                          Container(width: 4.0,),
                          Icon(Icons.date_range,
                               color: Colors.white,
                               size: 16.0),                       
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
}
}