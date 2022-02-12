import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../button_widget.dart';
import 'firebase_api.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(MaterialApp(home: Camera()));
}


class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? file;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    //final fileName = basename(_imageFile!.path);
    return Scaffold(
      appBar: AppBar(

      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
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
                SizedBox(height: 48),
                ButtonWidget(
                  text: "Upload File",
                  icon: Icons.cloud_upload_outlined,
                  onClicked: uploadFile,
                )
              ],
            )
        ),
      ),
    );
  }

  Future selectFile() async{
    final result = await ImagePicker().pickImage(source: ImageSource.camera);

    if(result == null) return;
    final path = result.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async{
    if(file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName'; // the folder where the image will get saved in Firebase

    FirebaseApi.uploadFile(destination, file!);
  }

}


