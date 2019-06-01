class Ubicaciones{
  List<Ubicacion> items =  new List();

  Ubicaciones();
  Ubicaciones.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for (var item in jsonList) {
      final ubicacion = new Ubicacion.fromJsonMap(item);
      items.add(ubicacion);   
    }
  }
}
class Ubicacion {
  String formattedAddress;
  Geometry geometry;
  String icon;
  String id;
  String name;
  OpeningHours openingHours;
  List<Photo> photos;
  String photoReference;
  String placeId;
  PlusCode plusCode;
  int priceLevel;
  double rating;
  String reference;
  List<Type> types;
  int userRatingsTotal;

  //Campos adicionales al cruzar contra el servicio FB
  String comentario;
  String descripcion;
  String lng;
  String lat;
  String nombre;
  String ranking;
  String ubicacion;

  Ubicacion({
    this.formattedAddress,
    this.geometry,
    this.icon,
    this.id,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reference,
    this.types,
    this.userRatingsTotal,
    this.comentario,
    this.descripcion,
    this.lng,
    this.lat,
    this.nombre,
    this.ranking,
    this.ubicacion,
  });

  Ubicacion.fromJsonMap(Map<String,dynamic> json){
      formattedAddress =  json["formatted_address"];
      // geometry         =   json["geometry"];
      // icon          = json["icon"];
      id            =json["id"];
      name          = json["name"];
      // openingHours  = json["opening_Hours"];
      photos        = Photo.fromJsonList(json["photos"]).items;
      photoReference = Photo.fromJsonList(json["photos"]).photoReference;
      // placeId       = json["place_Id"];
      // plusCode      = json["plus_Code"];
      // priceLevel    = json["price_Level"];
      // rating        = json["rating"];
      // reference     = json["reference"];
      // types         = json["types"];
      // userRatingsTotal = json["user_Ratings_Total"];
  }
}


class Geometry {
  Location location;
  Viewport viewport;

  Geometry({
    this.location,
    this.viewport,
  });
}

class Location {
  double lat;
  double lng;

  Location({
    this.lat,
    this.lng,
  });
}

class Viewport {
  Location northeast;
  Location southwest;

  Viewport({
    this.northeast,
    this.southwest,
  });
}

class OpeningHours {
  bool openNow;

  OpeningHours({
    this.openNow,
  });
}

class Photo {
  int height;
  List<String> htmlAttributions;
  String photoReference;
  int width;

  Photo({
    this.height,
    this.htmlAttributions,
    this.photoReference,
    this.width,
  });

 Photo.fromJsonMap(Map<String,dynamic> json){
    photoReference = json["photo_reference"];     
  } 

  List<Photo> items =  new List();

  Photo.fromJsonList(List<dynamic> jsonList){ 
    if(jsonList ==null)return;
    for (var item in jsonList) {
      final photo = new Photo.fromJsonMap(item);
      items.add(photo);   
    }
}

}

class PlusCode {
  String compoundCode;
  String globalCode;

  PlusCode({
    this.compoundCode,
    this.globalCode,
  });
}

enum Type { RESTAURANT, FOOD, POINT_OF_INTEREST, ESTABLISHMENT, BAR, CAFE, NIGHT_CLUB }
