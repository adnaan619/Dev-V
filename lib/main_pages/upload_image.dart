import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:path/path.dart';
// import '../button_widget.dart';
// import 'firebase_api.dart';
import 'package:tflite/tflite.dart';

class ImageUpload extends StatefulWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<ImageUpload> {
  File? imageURI;
  List? output;
  late String path;

  Future getImageFromCamera() async {
    var image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image == null) {
      return null;
    }
    setState(() {
      imageURI = File(image.path);
      path = image.path;
      output = null;
    });
    // ignore: deprecated_member_use
  }

  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image == null) {
      return null;
    }
    setState(() {
      imageURI = File(image.path);
      path = image.path;
      output = null;
    });
  }

  Future classifyImage() async {
    output = null;
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite", labels: "assets/labels.txt");
    var result = await Tflite.runModelOnImage(
        path: path,   // required
        imageMean: 127.5,   // defaults to 117.0
        imageStd: 127.5,  // defaults to 1.0
        numResults: 4,    // defaults to 5
        threshold: 0.5,   // defaults to 0.1
        asynch: true
    );

    setState(() {
      output = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double genislik = MediaQuery.of(context).size.width;
    final double yukseklik = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(),
          padding: EdgeInsets.only(top: yukseklik * 0.01),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              imageURI == null
                  ? Text(" Choose Picture ", style: TextStyle(fontSize: 21))
                  : Image.file(
                imageURI!,
                width: genislik * 0.99,
                height: 240,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: MaterialButton(
                      height: 50,
                      onPressed: () => getImageFromCamera(),
                      child: Text('Camera'),
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: MaterialButton(
                      height: 50,
                      onPressed: () => getImageFromGallery(),
                      child: Text('Gallery'),
                      textColor: Colors.black,
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: MaterialButton(
                      height: 50,
                      onPressed: () => classifyImage(),
                      child: Text('Scan'),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
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
                                "\n The results are not 100% correct, please do not apply treatment without consulting your doctor!",
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

