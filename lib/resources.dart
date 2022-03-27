import 'dart:ui';

Color c = const Color(0xFFFF2943);
Color b = const Color(0x4A040404);

class FormValidator {
  static String? validateEmail(String? email) {
    if(email!.isEmpty){
      return("Please enter your email!");
    }
    // reg expression for email validation
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(email)) {
      return ("Please enter a valid email!");
    }
    return null;

  }

  static String? validatePassword(String? password) {
    if(password!= null){
      RegExp regex = RegExp(r'^.{6,}$');
      if (password.isEmpty) {
        return ("Password is required for sign in!");
      }
      else if (!regex.hasMatch(password)) {
        return ("Password must be at least 6 characters!");
      }
    }
    return null;
  }
}

class SignUpValidator {
  static String? validateFirstName(String? firstName) {
    RegExp regex = RegExp(r'^.{3,}$');
    if (firstName!.isEmpty) {
      return ("First name cannot be empty!");
    }
    if (!regex.hasMatch(firstName)) {
      return ("Enter valid name! (Min. 3 characters)");
    }
    return null;
  }

  static String? validateLastName(String? lastName) {
    if (lastName!.isEmpty) {
      return ("Last name cannot be empty!");
    }
    return null;
  }

  static String? validateAddress(String? address) {
    RegExp regex = RegExp(r'^.{10,}$');
    if (address!.isEmpty) {
      return ("Address cannot be empty!");
    }
    if (!regex.hasMatch(address)) {
      return ("Enter valid address! (Min. 10 characters)");
    }
    return null;
  }
}
