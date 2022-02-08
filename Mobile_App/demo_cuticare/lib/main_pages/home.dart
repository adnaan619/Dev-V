import 'package:demo_cuticare/main_pages/profile.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home(
        // initialRoute: '/', //overriding the default route
        // routes:{
        //   '/': (context) => Loading(),
        //   '/home': (context) => Home(),
        //   '/location': (context) => ChooseLocation()
        // }
    )
));

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        child: Center(
          child: Scaffold(
              body: SizedBox(
                height: 170,
                width: 100,
                child: InkWell(
                  child: Container(
                    color:Colors.yellowAccent,
                    child: Text("Click Here")
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> Profile())
                    );
                  }
                ),
              )
            ),
          ),
    );
  }
}