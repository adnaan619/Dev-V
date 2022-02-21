import 'dart:io';

// import 'package:demo_cuticare/main_pages/profile.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'upload_image.dart';

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

      body: Center(
        child: InkWell(
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
                    'assets/camera-icon.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),

    );
  }
}


