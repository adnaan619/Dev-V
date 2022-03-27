import 'package:demo_cuticare/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'google_sign_in_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.red, colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.yellowAccent)),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}