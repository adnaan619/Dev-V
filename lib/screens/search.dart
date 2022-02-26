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
                  CameraPosition(target: latlng(), zoom: 16.0),
              zoomGesturesEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}