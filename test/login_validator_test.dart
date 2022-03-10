import 'package:demo_cuticare/resources.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('Empty email test',(){
    var result=FormValidator.validateEmail('');
    expect(result, "Please enter your email!");
  });
  test('Invalid Email test',(){
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