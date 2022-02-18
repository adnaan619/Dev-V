import 'dart:io';

import 'package:demo_cuticare/main_pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showPassword = false;

  File? file;
  final picker = ImagePicker();
  late String path;
  @override
  Widget build(BuildContext context) {

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
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Settings()));
                },
              ),
            ]
        ),
        body: Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Text(
                  "Edit Profile",
                  style: TextStyle(fontFamily: 'Roboto',fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 15),
                Center(
                  child: Stack(
                    children: [
                      Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 4,
                                  color: Theme.of(context).scaffoldBackgroundColor
                              ),
                              boxShadow:[
                                BoxShadow(
                                    spreadRadius: 2, blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(1,10)
                                ),
                              ],
                              shape:BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage("")
                              )
                          )
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width:4,
                                color: Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.green,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.white,
                              onPressed: () {
                                _askedToLead();
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                buildTextField("Full Name", "Dor Alex",false),
                buildTextField("E-mail", "Dor Alex",false),
                buildTextField("Password", "Dor Alex",true),
                buildTextField("Location", "Dor Alex",false),
                SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    OutlineButton(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),

                      onPressed: (){},
                      child: Text("Cancel",
                          style: TextStyle(fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),
                    SizedBox(width: 50),
                    RaisedButton(
                        onPressed: (){},
                        color: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text("SAVE",
                            style: TextStyle(
                                fontSize: 14,
                                letterSpacing: 2.2,
                                color: Colors.white
                            ))
                    )
                  ],
                ),
              ], // to allow users to scroll
            ),
          ),
        )
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration:InputDecoration(
            suffixIcon: isPasswordTextField ? IconButton(
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            ) : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText:  labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
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
                onPressed: () { selectFile(); },
                child: const Text('Take Photo'),
              ),
              SimpleDialogOption(
                onPressed: () { selectGallery(); },
                child: const Text('Choose from Gallery'),
              ),
            ],
          );
        }
    );
  }
  selectFile() async {
    PickedFile? cameraImage = await ImagePicker().getImage(
        source: ImageSource.camera);

    if (cameraImage == null) return;


    setState(() {
      path = cameraImage.path;
      file = File(path);
      //output = null;
    });
  }

  selectGallery() async {
    PickedFile? cameraImage = await ImagePicker().getImage(
        source: ImageSource.gallery);

    if (cameraImage == null) return;


    setState(() {
      path = cameraImage.path;
      file = File(path);
      //output = null;
    });
  }

}
