import 'dart:io';

import 'package:demo_cuticare/main_pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

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
  File? image;

  // Future pickImage(ImageSource source) async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: source);
  //     if (image == null) return;
  //     final imageTemporary = File(image.path);
  //     setState(() => this.image = imageTemporary);
  //     MaterialPageRoute(
  //       builder: (context) =>
  //           Profile()
  //     );
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image:  $e');
  //   }
  // }
  pickImage(ImageSource source) async {
    final navigator = Navigator.of(context);
    File pickedImage = await ImagePicker().pickImage(source: source) as File;
    if (pickedImage != null) {
      print(pickedImage.path);
      await navigator.push(
          MaterialPageRoute(
              builder: (context) =>
                  Profile()
          ),
      );

    }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: InkWell(
                    onTap: () => pickImage(ImageSource.gallery), // Image tapped
                    child: Image.asset(
                      'assets/camera-icon.png',
                      fit: BoxFit.cover, // Fixes border issues
                      width: 250.0,
                      height: 250.0,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                InkWell(
                  onTap: () => pickImage(ImageSource.camera), // Image tapped // Image tapped
                  child: Image.asset(
                    'assets/camera-icon.png',
                    fit: BoxFit.cover, // Fixes border issues
                    width: 250.0,
                    height: 250.0,
                  ),
                )
              ])
      );
    }
  }


