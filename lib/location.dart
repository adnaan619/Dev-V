import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return FutureProvider(

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
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/3,
            width:  MediaQuery.of(context).size.width,
            child: GoogleMap(
              initialCameraPosition:
              CameraPosition(target: LatLng(29.9792, 31.1342), zoom: 16.0),
              zoomGesturesEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}