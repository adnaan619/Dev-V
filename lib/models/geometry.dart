import 'package:demo_cuticare/models/locations1.dart';

class Geometry{
  final Locations1 location;

  Geometry({this.location});

  Geometry.fromJson(Map<dynamic,dynamic> parsedJson)
      :location = Locations1.fromJson(parsedJson['location']);
}