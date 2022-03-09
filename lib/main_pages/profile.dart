import 'dart:io';
import 'package:demo_cuticare/main_pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../resources.dart';
import '../sign_in.dart';


void main() {
  runApp(MaterialApp(
  ));
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var profilePicUrl =
      'assets/avatar.png';
  bool showPassword = false;
  File? imageURI;
  List? output;
  late String path;
  final picker = ImagePicker();
  bool isLoading = false;



 // UserManagement userManagement = new UserManagement();



  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   FirebaseAuth.instance.currentUser!.then((user) {
  //     setState(() {
  //       profilePicUrl = user.photoUrl;
  //     });
  //   }).catchError((e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   });
  // }



  // Future uploadImage() async {
  //   var randomno = Random(25);
  //   final Reference firebaseStorageRef = FirebaseStorage.instance
  //       .ref()
  //       .child('profilepics/${randomno.nextInt(5000).toString()}.jpg');
  //   UploadTask task = firebaseStorageRef.putFile(imageURI!);
  //
  //   task.future.then((value) {
  //     setState(() {
  //       userManagement
  //           .updateProfilePic(value.downloadUrl.toString())
  //           .then((val) {
  //         setState(() {
  //           profilePicUrl = value.downloadUrl.toString();
  //           isLoading = false;
  //         });
  //       });
  //     });
  //   }).catchError((e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   });
  // }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,

            elevation: 1,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: c,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: c,
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
                          width: 150.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  image: NetworkImage(profilePicUrl),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: const [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ])),
                      SizedBox(height: 20.0),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(

                            // padding: EdgeInsets.all(0.1),

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width:4,
                                color: Theme.of(context).scaffoldBackgroundColor,
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
                  height: 5,
                ),
                Row(
                  children: [

                    SizedBox(width: 40),
                    OutlinedButton(
                      // padding: EdgeInsets.symmetric(horizontal: 50),
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20)),


                      onPressed: (){},
                      child: Text("Cancel",
                          style: TextStyle(fontSize: 14,
                              letterSpacing: 2.2,
                              color: Colors.black)),
                    ),

                    SizedBox(width: 100),
                    ElevatedButton(
                        onPressed: (){},
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
