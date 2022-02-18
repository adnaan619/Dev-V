import 'dart:io';

import 'package:demo_cuticare/main_pages/profile.dart';

import 'package:demo_cuticare/main_pages/sign_in_form.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import '../sign_in.dart';
import 'camera.dart';
import 'gallery.dart';

class Home extends StatefulWidget {
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
      MaterialPageRoute(
          builder: (context) =>
              Profile()
      );
    } on PlatformException catch (e) {
      print('Failed to pick image:  $e');
    }
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
   
            children: [


              InkWell(
                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(builder: (context) => Camera()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 70),

                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/camera-icon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,

                    MaterialPageRoute(builder: (context) => Gallery()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(left: 70),
                  width: 250.0,
                  height: 250.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/camera-icon.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ])
    );
  }
}


