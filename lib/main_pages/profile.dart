import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_cuticare/main_pages/app_settings.dart';
import 'package:demo_cuticare/sign_up_model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../resources.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool showPassword = false;
  var profilePicUrl = "https://drive.google.com/file/d/1YSs58WxxIMqAYjQEKlJQi5VFwAT0mUOO/view?usp=sharing";
  File? imageURI;
  List? output;
  late String path;
  final picker = ImagePicker();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
    .collection("users")
    .doc(user!.uid)
    .get()
    .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
            backgroundColor: Theme
                .of(context)
                .scaffoldBackgroundColor,
            elevation: 1,
            // leading: IconButton(
            //   icon: Icon(
            //     Icons.arrow_back,
            //     color: c,
            //   ),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => ForgotPassword()),
            //     );
            //   },
            // ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: c,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AppSettings()));
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
                  style: TextStyle(fontFamily: 'Roboto',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Center(
                  child: profileImage()
                ),
                SizedBox(
                  height: 35,
                ),
                Text("Full name", style: TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                SizedBox(height:5),
                Row(
                    children: <Widget>[
                      // ...
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${loggedInUser.firstName} ${loggedInUser.lastName}",
                                style: TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,
                                height: 25,
                                thickness: 1,
                                endIndent: 10)
                          ],
                        ),
                      ),
                    ]),


                SizedBox(height:15),

                Text("E-mail", style: TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                SizedBox(height:5),

                Row(
                    children: <Widget>[
                      // ...
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${loggedInUser.email}",
                                style: TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
                            Divider(color: Colors.black,
                                height: 25,
                                thickness: 1,
                                endIndent: 10)
                          ],
                        ),
                      ),
                    ]),

                SizedBox(height:15),

                Text("Address", style: TextStyle(fontSize:25,fontWeight: FontWeight.bold)),
                SizedBox(height:5),

              Row(
                children: <Widget>[
                // ...
                Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      Text("${loggedInUser.address}",
                        style: TextStyle(fontSize:15,fontWeight: FontWeight.bold)),
                      Divider(color: Colors.black,
                          height: 25,
                          thickness: 1,
                          endIndent: 10)
                    ],
                  ),
                ),
            ]),

                SizedBox(height: 35),

                Row(
                  children: [

                    SizedBox(width: 40),
                    OutlinedButton(
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20)),

                      onPressed: () {},
                      child: Text("Cancel",
                          style: TextStyle(fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),

                    SizedBox(width: 100),
                    ElevatedButton(
                        onPressed: () {

                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(c),
                        ),
                        // color: c,
                        // padding: EdgeInsets.symmetric(horizontal: 50),
                        // // elevation: 2,
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(20)),

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
