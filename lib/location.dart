import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import '../models/place.dart';
import 'package:demo_cuticare/models/place.dart';
import 'package:demo_cuticare/services/geolocator_service.dart';
import 'package:demo_cuticare/services/places_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
      FutureProvider(create: (context) => locatorService.getLocation()),
      ProxyProvider<Position,Future<List<Place>>>(
          update: (context,position,places){
            return (position != null) ? placesService.getPlaces(position.latitude, position.longitude) : null;
          },
        )
      ],
      child: MaterialApp(
        title: 'Location Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}

class Search extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final currentPosition = Provider.of<Position>(context);
    final placesProvider = Provider.of<Future<List<Place>>>(context);

    return FutureProvider(
      create: (context) => placesProvider,
      child: Scaffold(
        body: (currentPosition != null)
            ? Consumer<List<Place>>(
                builder: (_, places, __) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        width: MediaQuery.of(context).size.width,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  currentPosition.latitude,
                                  currentPosition.longitude),
                              zoom: 16.0),
                          zoomGesturesEnabled: true,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: places.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: ListTile(
                                  title: Text(places[index].name),
                                ),
                              );
                            }),
                      )
                    ],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
            ),
      ),
    );
  }
}

// class GeoLocatorService{
//
//   Future<Position> getLocation() async {
//     var geolocator = Geolocator();
//     return await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, locationPermissionLevel: GeolocationPermission.location);
//   }
// }


// class Geometry{
//   final Locations1 location;
//
//   Geometry({this.location});
//
//   Geometry.fromJson(Map<dynamic,dynamic> parsedJson)
//       :location = Locations1.fromJson(parsedJson['location']);
// }

// class Locations1{
//   final double lat;
//   final double lng;
//
//   Locations1({this.lat, this.lng});
//
//   Locations1.fromJson(Map<dynamic,dynamic> parsedJson)
//       :lat = parsedJson['lat'], lng = parsedJson['lng'];
// }

// class Place{
//   final String name;
//   final double rating;
//   final int userRatingCount;
//   final String vicinity;
//   final Geometry geometry;
//
//   Place({this.geometry, this.name, this.rating, this.userRatingCount, this.vicinity});
//
//   Place.fromJson(Map<dynamic, dynamic> parsedJson)
//       :name = parsedJson['name'],
//         rating = (parsedJson['rating'] != null) ? parsedJson['rating'].toDouble() : null,
//         userRatingCount = (parsedJson['user_rating_count'] != null) ? parsedJson['user_rating_total'] : null,
//         vicinity = parsedJson['vicinity'],
//         geometry = Geometry.fromJson(parsedJson['geometry']);
// }

// class PlacesService{
//   final key = 'AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g';
//
//   Future<List<Place>> getPlaces(double lat, double lng) async {
//     var response = await http.get('https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lng}&type=hospital&rankby=distance&key=AIzaSyAotlb6mwzAp0tJaBEMgB_wQ68d5-9YP3g');
//     var json = convert.jsonDecode(response.body);
//     var jsonResults = json['results'] as List;
//     return jsonResults.map((place) => Place.fromJson(place)).toList();
//   }
// }