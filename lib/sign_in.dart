import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
    home: SignIn()
));

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Color c = const Color(0xFFFF2943);
  bool _isHidden = true;

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
              Container(
                child: Stack(
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
              ),
              Container(
                padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                            labelText: "EMAIL",
                            labelStyle: TextStyle(
                                fontFamily: "Roboto", fontWeight: FontWeight.bold, color:Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: c),
                            )
                        ),
                      ),
                      SizedBox(height: 20.0),
                      TextField(
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
                                fontFamily: "Roboto", fontWeight: FontWeight.bold, color:Colors.grey
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: c),
                            )
                        ),
                        // obscureText: true,
                      ),
                      SizedBox(height: 5.0),
                      Container(
                        alignment: Alignment(1.0,0.0),
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
                      Container(
                        height: 50.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          // shadowColor: Colors.green,
                          color: c,
                          // elevation: 7.0,
                          child: GestureDetector(
                            onTap:(){},
                            child: Center(
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                    color:Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Roboto"
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height:20.0),
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
                              borderRadius:BorderRadius.circular(20.0)
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Center(
                                  child: ImageIcon(AssetImage("assets/google-icon.png")),
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
                              borderRadius:BorderRadius.circular(20.0)
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  const [
                                Center(
                                  child:  ImageIcon(AssetImage("assets/facebook-icon.png")),
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
                      onTap: (){},
                      child: Text("Register",
                        style: TextStyle(
                          color: c,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]),
            ]));
  }


  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}