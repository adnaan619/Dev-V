import 'package:demo_cuticare/models/place.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService{
  final key = 'AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g';

  Future<List<Place>> getPlaces(double lat, double lng, BitmapDescriptor) async {
    var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lng}&type=hospital&rankby=distance&key=AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g');
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place,icon)).toList();
  }

}