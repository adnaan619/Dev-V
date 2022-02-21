
import 'package:demo_cuticare/resources.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main_pages/bottom_nav_bar.dart';
import 'main_pages/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  bool _isHidden = true;
  
  // firebase
  final _auth = FirebaseAuth.instance;

  // string for displaying the error Message
  // String? errorMessage;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        resizeToAvoidBottomInset: false,
        // appBar: AppBar(
        //   backgroundColor: Colors.white
        // ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 60.0, 0.0, 0.0),
                      child: Text("Cuti",
                          style: TextStyle(
                              fontSize:80.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 120.0, 0.0, 0.0),
                      child: Text("Care",
                          style: TextStyle(
                              fontSize:80.0, fontWeight: FontWeight.bold)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(177.0, 120.0, 100.0, 0.0),
                      child: Text(".",
                          style: TextStyle(
                              fontSize:80.0, fontWeight: FontWeight.bold, color: c)
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 210.0, 0.0, 0.0),
                      child: Text("We're so excited to see you again!",
                          style: TextStyle(color: c)
                      ),
                    ),
                  ]),

                    Form(
                      key: _formKey,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: Column(
                            children: [
                              TextFormField(
                                autofocus: false,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
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
                                onSaved: (value){
                                  emailController.text = value!;
                                },
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                    labelText: "EMAIL",
                                    labelStyle: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: c),
                                    )
                                ),
                              ),

                              SizedBox(height: 20.0),

                              TextFormField(
                                autofocus: false,
                                controller: passwordController,

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
                                onSaved: (value){
                                  passwordController.text = value!;
                                },
                                textInputAction: TextInputAction.done,
                                decoration: InputDecoration(
                                    labelText: "PASSWORD",
                                    suffix: InkWell(
                                      onTap: _togglePasswordView,
                                      child: Icon(
                                        _isHidden
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                    labelStyle: TextStyle(
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(color: c),
                                    )
                                ),
                                // obscureText: true,
                              ),

                              SizedBox(height: 5.0),

                              Container(
                                alignment: Alignment(1.0, 0.0),
                                padding: EdgeInsets.only(top: 15.2, left: 20.0),
                                child: InkWell(
                                  // onTap:(){
                                  //   setState(() {
                                  //
                                  //   });
                                  // },
                                  child: Text("Forgot Password?",
                                    style: TextStyle(
                                      color: c,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Roboto",
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.0),
                               Material(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: c,
                                  elevation: 7.0,
                                  child: MaterialButton(
                                    onPressed: (){
                                      signIn(emailController.text, passwordController.text);
                                      },
                                    child: Center(
                                      child: Text(
                                        "LOGIN",
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

                              Container(
                                height: 50.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Center(
                                          child: ImageIcon(
                                              AssetImage(
                                                  "assets/google-icon.png")),
                                        ),
                                        SizedBox(width: 10.0),
                                        Center(
                                          child: Text(
                                            "Log in with Google",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Roboto"
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                      ]),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Container(
                                height: 50.0,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black,
                                          style: BorderStyle.solid,
                                          width: 1.0
                                      ),
                                      color: Colors.transparent,
                                      borderRadius: BorderRadius.circular(20.0)
                                  ),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Center(
                                          child: ImageIcon(AssetImage(
                                              "assets/facebook-icon.png")),
                                        ),
                                        SizedBox(width: 10.0),
                                        Center(
                                          child: Text(
                                            "Log in with Facebook",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Roboto"
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                      ]),
                                ),
                              )
                            ]),
                      ),
                    ),


              SizedBox(height: 15.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "New to CutiCare?",style: TextStyle(
                      fontFamily: "Roboto",
                    )),
                    SizedBox(width: 5.0),
                    InkWell(

                      onTap: (){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>   SignUp()),
                      );
                        },

                      child: Text("Register",
                        style: TextStyle(
                          color: c,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),

            ]),
    );
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }


  // login function
  void signIn(String email, String password) async {
    if (_formKey.currentState!.validate()) {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => BottomNavBar())),
        }).catchError((e){
        Fluttertoast.showToast(msg: e!.message);

      });
    }
  }
}



