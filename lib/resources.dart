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
  static String validateFirstName(String? firstName) {
    return firstName != null
        ? firstName.isEmpty
        ? "First name cannot be empty!"
        : RegExp(r'^.{3,}$')
        .hasMatch(firstName)
        ? ""
        : "Enter valid name! (Min. 3 characters)"
        : "First name cannot be empty!";
  }

  static String validateLastName(String? lastName) {
    return lastName!.isEmpty
        ? "Last name cannot be empty!"
        : "";
  }
}
