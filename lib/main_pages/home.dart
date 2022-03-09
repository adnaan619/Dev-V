import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'upload_image.dart';

void main() {
  runApp(MaterialApp(
      home: Home()
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;


  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
      // MaterialPageRoute(
      //     builder: (context) =>
      //         Profile()
      // );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image:  $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80.0),
            Row(children:[
              Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage("assets/avatar.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(75.0)),
                      boxShadow: const [
                        BoxShadow(blurRadius: 7.0, color: Colors.black)
                      ])
              ),
              SizedBox(width:30.0),
              Container(
                child: Text("Rusini Thara Gunarathne"),

              ),
            ]),

            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  SizedBox(height: 100.0),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ImageUpload()),
                      );
                    },
                    child: Container(
                      width: 250.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/upload_img.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ]),
          ]),
    );
  }
}