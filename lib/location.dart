import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  final locatorService = GeoLocatorService();
  @override
  Widget build(BuildContext context){
    return FutureProvider(
      create: (context) => locatorService.getLocation(),
      child: MaterialApp(
        title: 'Parking App',
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

    return Scaffold(
      body: (currentPosition != null)
          ? Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height/3,
                width:  MediaQuery.of(context).size.width,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(currentPosition.latitude, currentPosition.longitude), zoom: 16.0),
                  zoomGesturesEnabled: true,
                ),
              ),
            ],
          )
          : Center(
        child: CircularProgressIndicator(),
          ),
    );
  }
}

class GeoLocatorService{

  Future<Position> getLocation() async {
    var geolocator = Geolocator();
    return await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high, locationPermissionLevel: GeolocationPermission.location);
  }
}