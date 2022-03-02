class Locations1{
  final double lat;
  final double lng;

  Locations1({this.lat, this.lng});

  Locations1.fromJson(Map<dynamic,dynamic> parsedJson)
      :lat = parsedJson['lat'],
        lng = parsedJson['lng'];
}