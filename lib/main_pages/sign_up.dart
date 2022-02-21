
// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../resources.dart';
import '../sign_up_model/user_model.dart';
import 'bottom_nav_bar.dart';

class SignUp extends StatefulWidget {
  const SignUp ({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  // editing Controller
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final confirmPasswordEditingController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Login Page '),
      //),

      body: SingleChildScrollView(

        child: Form(
          key: _formKey,
          child: Container(
            decoration:BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/backg.png'),
              //     fit: BoxFit.cover
              // ),
            ),
            child :Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  Text('Welcome  ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 30.0),),
                  //SizedBox(height: 10.0),
                  //Image.asset("assets/google.jpg",height: 150,width:150 ,),
                  SizedBox(height: 10.0),
                  Text('Please enter your details ',textAlign:TextAlign.left ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black , fontSize: 20.0),),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: firstNameEditingController,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{3,}$');
                        if (value!.isEmpty) {
                          return ("First name cannot be empty!");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter valid name! (Min. 3 characters)");
                        }
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderSide:BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        prefixIcon: Icon(Icons.subject),
                        hintText: 'Enter your first name ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: lastNameEditingController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Last name cannot be empty!");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        lastNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide:BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        prefixIcon: Icon(Icons.subject_rounded),
                        hintText: 'Enter your last name  ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: emailEditingController,
                      validator: (value) {
                        if(value!.isEmpty){
                          return("Please enter your email!");
                        }
                        // reg expression for email validation
                        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            .hasMatch(value)) {
                          return ("Please Enter a valid email!");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        firstNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide:BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: passwordEditingController,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return ("Password is required for sign in");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Password(Min. 6 Character)");
                        }
                        return null;
                      },
                      onSaved: (value) {
                        firstNameEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide:BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Password ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: confirmPasswordEditingController,
                      validator: (value) {
                        if (confirmPasswordEditingController.text !=
                            passwordEditingController.text) {
                          return "Password don't match";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmPasswordEditingController.text = value!;
                      },
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide:BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius:BorderRadius.all(Radius.circular(20.0)),
                            borderSide: BorderSide(color: Colors.blueGrey)
                        ),
                        prefixIcon: Icon(Icons.password),
                        hintText: ' Reenter Password ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal:20 ),
                  //   margin: EdgeInsets.only(top: 10),
                  //   child: TextFormField(
                  //     decoration: InputDecoration(
                  //       enabledBorder:OutlineInputBorder(
                  //           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  //           borderSide:BorderSide(color: Colors.transparent)
                  //       ),
                  //       focusedBorder:OutlineInputBorder(
                  //           borderRadius:BorderRadius.all(Radius.circular(20.0)),
                  //           borderSide: BorderSide(color: Colors.blueGrey)
                  //       ),
                  //       prefixIcon: Icon(Icons.password),
                  //       hintText: 'Gender ',
                  //       fillColor:Colors.transparent,
                  //       filled: true,
                  //     ),
                  //   ),
                  // ),

                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child:MaterialButton(
                      onPressed: () { signUp(emailEditingController.text, passwordEditingController.text);},
                      child: Text('   SIGN UP   ',
                        style: TextStyle(color:Colors.white )),
                    ),
                    decoration: BoxDecoration( color: c , borderRadius: BorderRadius.circular(10.0)),

                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) => {postDetailsToFirestore()})
            .catchError((e) {
          Fluttertoast.showToast(msg: e!.message);
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";
            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    }
  }

  postDetailsToFirestore() async {
    // calling our firestore
    // calling our user model
    // sending these values

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();

    // writing all the values
    userModel.email = user!.email;
    userModel.uid = user.uid;
    userModel.firstName = firstNameEditingController.text;
    userModel.lastName = lastNameEditingController.text;

    await firebaseFirestore.collection("users").doc(user.uid).set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfully :) ");

    Navigator.pushAndRemoveUntil((context), MaterialPageRoute(builder: (context) => BottomNavBar()), (route) => false);
  }

}
