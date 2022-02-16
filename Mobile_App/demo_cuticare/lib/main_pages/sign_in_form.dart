  import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

  class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

      ]
    );
  }
  Padding buildInputForm(String label, bool pass) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
          decoration: InputDecoration(
          labelText: "Email",
            labelStyle:TextStyle(
                color: Colors.red
      ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red)
            ),
            suffixIcon: IconButton(onPressed: (){},
                icon: Icon(Icons.visibility_off))
          ),
      ),
    );
  }
}
