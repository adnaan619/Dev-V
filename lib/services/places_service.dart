import 'package:demo_cuticare/models/place.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesService {
  final key = 'AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g';

  Future<List<Place>> getPlaces(double lat, double lng, BitmapDescriptor icon) async {
    var response = await http.get(Uri.parse('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=6.9271,79.8612&type=hospital&rankby=distance&key=AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g'));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place,icon)).toList();
  }

}


// https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=hospital&rankby=distance&key=AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g