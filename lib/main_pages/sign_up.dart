import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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
  final addressEditingController = TextEditingController();

  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(
                top: 20.0, left: 20.0, right: 20.0),
            margin: EdgeInsets.only(top: 50),
            decoration:BoxDecoration(
              // image: DecorationImage(
              //     image: AssetImage('assets/backg.png'),
              //     fit: BoxFit.cover
              // ),
            ),
              child: Column(
                children: [
                  // SizedBox(height: 80.0),
                  Text('Welcome to CutiCare! ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black, fontSize: 30.0),),
                  //SizedBox(height: 10.0),
                  //Image.asset("assets/google.jpg",height: 150,width:150 ,),
                  SizedBox(height: 10.0),
                  Text('Create an account',textAlign:TextAlign.left ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black , fontSize: 20.0),),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: firstNameEditingController,
                      validator: (value) {
                        SignUpValidator.validateFirstName(value);
                        return null;
                      },
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide:BorderSide(color: Colors.transparent)
                        ),
                        focusedBorder:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                        SignUpValidator.validateLastName(value);
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
                        FormValidator.validateEmail(value);
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
                        FormValidator.validatePassword(value);
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

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
                      controller: addressEditingController,
                        validator: (value) {
                          SignUpValidator.validateAddress(value);
                          return null;
                        },
                        onSaved: (value) {
                          addressEditingController.text = value!;
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
                        prefixIcon: Icon(Icons.location_on),
                        hintText: ' Address ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: c,
                    elevation: 7.0,
                    child: MaterialButton(
                      onPressed: (){
                        signUp(emailEditingController.text, passwordEditingController.text);
                      },
                      child: Center(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Roboto"
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
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
        if (kDebugMode) {
          print(error.code);
        }
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