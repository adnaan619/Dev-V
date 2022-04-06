import 'dart:io';

import 'package:demo_cuticare/resources.dart';
import 'package:demo_cuticare/sign_up_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'main_pages/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  bool showPassword = false;
  var profilePicUrl = "https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Favatar%2F&psig=AOvVaw1zh6TZQ3Qod_k9WQFeW5rq&ust=1648858939897000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLj7i63M8fYCFQAAAAAdAAAAABAD";
  File? imageURI;
  List? output;
  late String path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: c,
            ),
          ),
        ),
      body: ListView(
        children: [
          profileImage()
        ]
      )
    );
  }

  Future<void> _askedToLead() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select assignment'),
            children: <Widget>[
              SimpleDialogOption(

                onPressed: () { getImageFromCamera();},
                child: const Text('Take Photo'),
              ),
              SimpleDialogOption(
                onPressed: () { getImageFromGallery(); },

                child: const Text('Choose from Gallery'),
              ),
            ],
          );
        }
    );
  }


  Widget profileImage(){
    return Stack(
      children: [
        Container(
            width: 150.0,
            height: 150.0,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    image: NetworkImage(profilePicUrl),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                    Radius.circular(75.0)),
                boxShadow: const [
                  BoxShadow(blurRadius: 7.0, color: Colors.black)
                ])
        ),
        SizedBox(height: 20.0),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            // padding: EdgeInsets.all(0.1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 4,
                color: Theme
                    .of(context)
                    .scaffoldBackgroundColor,
              ),
              color: c,
            ),
            child: IconButton(
              icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () {
                _askedToLead();
              },
            ),
          ),
        )
      ],
    );
  }

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

}
