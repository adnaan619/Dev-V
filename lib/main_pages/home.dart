import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../sign_up_model/user_model.dart';
import 'upload_image.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(
        decoration:BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home_bg.png'),
              fit: BoxFit.cover
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.0),
              Row(children:[
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                              image: AssetImage("assets/avatar.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(55.0)),
                          boxShadow: const [
                            BoxShadow(blurRadius: 7.0, color: Colors.black)
                          ])
                  ),
                ),
                SizedBox(width:30.0),
                Text("${loggedInUser.firstName} ${loggedInUser.lastName}",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize:20)),
              ]),

              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    SizedBox(height: 100.0),
                    InkWell(
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
                                'assets/upload_img.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ]),
      ),
    );
  }
}

