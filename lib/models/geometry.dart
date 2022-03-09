import 'package:demo_cuticare/models/locations1.dart';

class Geometry{
  final Location location1;

  Geometry({this.location1});

  Geometry.fromJson(Map<dynamic,dynamic> parsedJson)
      :location1 = Location.fromJson(parsedJson['location']);
}