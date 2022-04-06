import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

import '../resources.dart';
import 'home.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ImageUpload> {
  File? imageURI;
  List? output;
  late String path;

  // select image from camera
  Future getImageFromCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      imageURI = File(image.path);
      path = image.path;
      output = null;
    });
  }

  // select image from gallery
  Future getImageFromGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      imageURI = File(image.path);
      path = image.path;
      output = null;
    });
  }

  // loading model
  Future classifyImage() async {
    output = null;
    await Tflite.loadModel(
        model: "assets/skin_quant_model.tflite", labels: "assets/labels.txt");
    var result = await Tflite.runModelOnImage(
      path: path, // image path
      numResults: 4,    // number of classes
      threshold: 0.5, // image threshold (defaults to 0.1)
      asynch: true,
    );

    setState(() {
      output = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: c,
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Home()));
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.only(top: height * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageURI == null
                  ? Text(" Upload Picture ", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold))
                  : Image.file(
                imageURI!,
                width: width * 0.99,
                height: 240,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: MaterialButton(
                      height: 50,
                      minWidth: 200,
                      onPressed: () => getImageFromCamera(),
                      child: Text('Camera'),
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                  )
              ),
              SizedBox(height: 10),
              Column(
                  children: const [
                    Text('OR',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 20.0))
                  ]),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: MaterialButton(
                      height: 50,
                      minWidth: 200,
                      onPressed: () => getImageFromGallery(),
                      child: Text('Gallery'),
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                  )
              ),
              SizedBox(height: 10),
              Column(
                  children: const [
                    Text('AND',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 20.0))
                  ]),
              SizedBox(height: 10),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: MaterialButton(
                      height: 50,
                      minWidth: 200,
                      onPressed: () => classifyImage(),
                      child: Text('Scan'),
                      textColor: Colors.white,
                      color: c,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ))),
              output == null
                  ? Text(' ')
                  : Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade200,
                   ),
                      child: RichText(
                      text: TextSpan(
                          text: prediction().toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 20),
                          children: const [
                            TextSpan(
                                text:
                                "\n The results are not 100% correct, "
                                    "please do not apply treatment without consulting your doctor!",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                    fontSize: 13))
                          ])),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }

  prediction() {
    try {
      return "Disease: " +
          output![0]["label"].toString().replaceAll("_", " ") +
          " \nConfidence: " +
          output![0]["confidence"]
              .toString()
              .substring(0, 3)
              .replaceAll("_", " ");
    } catch (e) {
      return "The disease could not be identified. Please try with another photo. ";
    }
  }
}
