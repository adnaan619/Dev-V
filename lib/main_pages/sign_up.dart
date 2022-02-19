import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: signin()
));

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
                      prefixIcon: Icon(Icons.drive_file_rename_outline),
                      hintText: 'Full name  ',
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
                      prefixIcon: Icon(Icons.male),
                      hintText: 'Gender ',
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
                    child: Text('Sign up ',style: TextStyle(color:Colors.white ,fontSize: 20),),
                  ),
                  decoration: BoxDecoration( color: Colors.redAccent , borderRadius: BorderRadius.circular(10.0)),

                ),


                Container(
                    padding: EdgeInsets.symmetric(horizontal:20 ),
                    margin: EdgeInsets.only(top: 10),

                    child: Iconss()


                )

              ],
            ),
          ),


        ),

      ),
    );
  }
}


class Iconss extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.8,
      child: Row(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal:50 ),
            margin: EdgeInsets.only(top: 10),
            child:InkWell(
              splashColor: Colors.black,
              onTap: () {},
              child: Ink.image(
                image: const AssetImage('assets/facebook1.png'),
                height: 79,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:0 ),
            margin: EdgeInsets.only(top: 5),
            child:InkWell(
                splashColor: Colors.black,
                onTap: () {},
                child: Ink.image(
                  image: const AssetImage('assets/google1.jpg'),
                  height:70,
                  width: 70,
                  fit: BoxFit.cover,

                )
            ),
          ),
        ],
      ),
    );
  }
}
