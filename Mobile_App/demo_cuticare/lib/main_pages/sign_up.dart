import 'package:flutter/material.dart';


class signin extends StatefulWidget {
  const signin ({Key? key}) : super(key: key);

  @override
  _signin createState() => _signin();
}

class _signin extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Login Page '),
      //),
      body: Container(
          decoration:BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backg.png'),
                fit: BoxFit.cover
            ),
          ),
          child :Container(
            child: Center(
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
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                        hintText: 'Enter your sur name  ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                  ),Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                        hintText: 'Gender ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),
                    child: TextFormField(
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
                        hintText: 'P. Number ',
                        fillColor:Colors.transparent,
                        filled: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child:FlatButton(
                      onPressed: () {  },
                      child: Text('___SIGN__up___ ',style: TextStyle(color:Colors.white ),),
                    ),
                    decoration: BoxDecoration( color: Colors.redAccent , borderRadius: BorderRadius.circular(10.0)),

                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
