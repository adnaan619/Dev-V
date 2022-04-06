import 'package:flutter/material.dart';

import 'package:demo_cuticare/models/place.dart';
import 'package:demo_cuticare/screens/search.dart';
import 'package:demo_cuticare/services/geolocator_service.dart';
import 'package:demo_cuticare/services/places_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class Location extends StatelessWidget{
  final locatorService = GeoLocatorService();
  final placesService = PlacesService();

  Location({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        FutureProvider(create: (context) => locatorService.getLocation(), initialData: null,),
        FutureProvider(create: (context) {
          ImageConfiguration configuration = createLocalImageConfiguration(context);
          return BitmapDescriptor.fromAssetImage(configuration, 'assets/hospitalIcon.png');
        }, initialData: null,),
        ProxyProvider2<Position,BitmapDescriptor,Future<List<Place>>>(
          update: (context,position,icon,places){
            return (position != null) ? placesService.getPlaces(position.latitude, position.longitude, icon) : Future.value([]);
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Location Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Search(),
      ),
    );
  }
}