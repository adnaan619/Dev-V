import 'package:demo_cuticare/resources.dart';
import 'package:demo_cuticare/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final GlobalKey<ScaffoldMessengerState> snackbarKey =
  GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignIn()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                      child: Text("Forgot",
                          style: TextStyle(
                              fontSize:70.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                      child: Text("Password",
                          style: TextStyle(
                              fontSize:70.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(330.0, 120.0, 100.0, 0.0),
                      child: Text("?",
                          style: TextStyle(
                              fontSize:70.0, fontWeight: FontWeight.bold, color: c)
                      ),
                    ),
                  ]),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) {
                  FormValidator.validateEmail(email);
                }
              ),
              SizedBox(height: 20),
              Material(
                borderRadius: BorderRadius.circular(20.0),
                color: c,
                elevation: 7.0,
                child: MaterialButton(
                  onPressed: (){
                    resetPassword();
                  },
                  child: Center(
                    child: Text(
                      "Reset Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Roboto"
                  ),
                ),
              ),
            ),
          ),
            ],
          )
        )
      )
    );
  }

  Future resetPassword() async{
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      snackbarKey.currentState?.showSnackBar(SnackBar(content: Text("Password Reset Email Sent!")));
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseException catch (e){
      if (kDebugMode) {
        print(e);
      }
      snackbarKey.currentState?.showSnackBar(SnackBar(content: Text((e.message).toString())));
      Navigator.of(context).pop();
    }

  }
}
