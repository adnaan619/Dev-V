import 'package:demo_cuticare/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Empty first name test',(){
    var result=SignUpValidator.validateFirstName('');
    expect(result, "First name cannot be empty!");
  });
  test('Invalid first name test',(){
    var result=SignUpValidator.validateFirstName('R2');
    expect(result, "Enter valid name! (Min. 3 characters)");
  });
  test('Empty last name test',(){
    var result=SignUpValidator.validateLastName('');
    expect(result, "Last name cannot be empty!");
  });
  test('Empty email test',(){
    var result=FormValidator.validateEmail('');
    expect(result, "Please enter your email!");
  });
  test('Invalid email test',(){
    var result=FormValidator.validateEmail('DdgyehsjkBEJ34');
    expect(result, "Please enter a valid email!");
  });
  test('Empty password test',(){
    var result=FormValidator.validatePassword('');
    expect(result, "Password is required for sign in!");
  });
  test('Invalid password test',(){
    var result=FormValidator.validatePassword('123');
    expect(result, "Password must be at least 6 characters!");
  });
}