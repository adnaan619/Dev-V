import 'package:demo_cuticare/resources.dart';
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

      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your email to reset your password.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24),
              ),
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
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                ),
                icon: Icon(Icons.email_outlined),
                label: Text(
                  "Reset Password",
                    style: TextStyle(fontSize: 24),
                ),
                onPressed: () { resetPassword(); },
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
