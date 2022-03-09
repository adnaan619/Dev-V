import 'dart:ui';

Color c = const Color(0xFFFF2943);
Color b = const Color(0x4A040404);

class FormValidator {
  static String validateEmail(String? email) {
    return email != null
        ? email.isEmpty
        ? "Please enter your email"
        : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)
        ? ""
        : "Please enter a valid email"
        : "Please enter your email";
  }

  static String? validatePassword(String? password) {
    return password != null
        ? password.isEmpty
        ? "Password is required for sign in"
        : password.length < 6
        ? "Password must be at least 6 characters"
        : ""
        : "Password is required for sign in";
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
