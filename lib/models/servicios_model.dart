class Servicios{
  List<Servicios> items =  new List();

  Servicios();
  Servicios.fromJsonList(List<dynamic> jsonList){
    if(jsonList =null)return;
    for (var item in jsonList) {
      final servicios = new Servicios.fromJsonMap(item);
      items.add(servicios);   
    }
  }
}
class Servicios {
  
  String icon;
  String id;
  String name;

  Servicios({

    this.icon,
    this.id,
    this.name,

  });

  Servicios.fromJsonMap(Map<String,dynamic> json){
      icon          = json["icon"];
      id            =json["id"];
      name          = json["name"];
  }
}

class Icon {
  bool icon;

  Icon({
    this.icon,
  });
}

class Id {
  bool id;

  Id({
    this.id,
  });
}

class Name {
  bool name;

  Name({
    this.name,
  });
}

enum Type { RESTAURANT, FOOD, POINT_OF_INTEREST, ESTABLISHMENT, BAR, CAFE, NIGHT_CLUB }
