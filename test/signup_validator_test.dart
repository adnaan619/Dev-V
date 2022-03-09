// import 'package:demo_cuticare/resources.dart';
// import 'package:flutter_test/flutter_test.dart';
//
// void main(){
//   test('Empty first name test',(){
//     var result=SignUpValidator.validateFirstName(null);
//     expect(result, "First name cannot be empty!");
//   });
//   test('Invalid first name test',(){
//     var result=SignUpValidator.validateFirstName('R2');
//     expect(result, "Enter valid name! (Min. 3 characters)");
//   });
//   test('Valid first name test',(){
//     var result=SignUpValidator.validateFirstName('Rusini');
//     expect(result, "");
//   });
//   test('Empty last name test',(){
//     var result=SignUpValidator.validateLastName('');
//     expect(result, "Last name cannot be empty!");
//   });
//   test('Valid last name test',(){
//     var result=SignUpValidator.validateLastName('Gunarathne');
//     expect(result, "");
//   });
//   test('Empty email test',(){
//     var result=FormValidator.validateEmail(null);
//     expect(result, "Please enter your email");
//   });
//   test('Invalid email test',(){
//     var result=FormValidator.validateEmail('DdgyehsjkBEJ34');
//     expect(result, "Please enter a valid email");
//   });
//   test('Valid email test',(){
//     var result=FormValidator.validateEmail('test@email.com');
//     expect(result, "");
//   });
//   test('Empty password test',(){
//     var result=FormValidator.validatePassword('');
//     expect(result, "Password is required for sign in");
//   });
//   test('Invalid password test',(){
//     var result=FormValidator.validatePassword('123');
//     expect(result, "Password must be at least 6 characters");
//   });
//   test('Valid password test',(){
//     var result=FormValidator.validatePassword('meow123');
//     expect(result, "");
//   });
// }