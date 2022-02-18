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

  runApp(MaterialApp(home: Gallery()));
}

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  File? file;

  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
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
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if(result == null) return;
    final path = result.files.single.path!;

    setState(() => file = File(path));
  }

  Future uploadFile() async{
    if(file == null) return;

    final fileName = basename(file!.path);
    final destination = 'files/$fileName'; // the folder where the image will get saved in Firebase

    FirebaseApi.uploadFile(destination, file!);
  }

}


