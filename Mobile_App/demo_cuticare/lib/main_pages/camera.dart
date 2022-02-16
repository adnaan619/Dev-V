import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:tflite/tflite.dart';
import '../button_widget.dart';
import 'firebase_api.dart';

class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  bool loading = true;
  File? file;
  List? output;
  final picker = ImagePicker();
  late String path;

  @override
  void initState(){
    super.initState();
    loadModel().then((value){ // set the state of load model
      setState((){});
    });
  }

  classifyImage() async { // run the model on the image
    var result =  await Tflite.runModelOnImage(
        path: path,
        numResults: 7,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5 // image standard deviation
    );
    setState(() {
      output = result;
      loading = false;
    });
  }

  loadModel() async{
    await Tflite.loadModel(model: 'assets/model.tflite', labels: 'assets/labels.txt');
  }

  @override
  void dispose() { // dispose and clear the memory
    // TODO: implement dispose
    Tflite.close(); // helps with the memory, any sort of memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final fileName = basename(_imageFile!.path);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {},
            ),
        ),
      body: Container(
        // padding: EdgeInsets.all(32),
        decoration: BoxDecoration(),
        padding: EdgeInsets.only(top: screenHeight * 0.01),
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          file == null ? Text(" Choose Picture ", style: TextStyle(fontSize: 21))
            : Image.file(
                file!,
                width: 290,
                height: 300,
                fit: BoxFit.fill,
        ),
          SizedBox(height: 10),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: "Select File",
                  icon: Icons.attach_file,
                  onClicked: selectFile,
                ),
                // SizedBox(height: 8),
                //     Text(
                //         // fileName,
                //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)
                //     ),
                SizedBox(height: 10),
                // ButtonWidget(
                //   text: "Upload File",
                //   icon: Icons.cloud_upload_outlined,
                //   onClicked: uploadFile,
                // )
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
              ]),
        ),
    ]),
      ),
    );
  }

  Future selectFile() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

      var cameraImage = await ImagePicker().pickImage(
          source: ImageSource.camera);

      if (cameraImage == null) return;


      setState(() {
        path = cameraImage.path;
        file = File(path);
        //output = null;
      });
  }

  Future uploadFile() async{
    if(file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName'; // the folder where the image will get saved in Firebase

    FirebaseApi.uploadFile(destination, file!);
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


