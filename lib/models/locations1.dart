class Location{
  final lat;
  final lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<dynamic,dynamic> parsedJson)
      :lat = parsedJson['lat'],
        lng = parsedJson['lng'];
}