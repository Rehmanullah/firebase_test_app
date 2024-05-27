import 'package:firebase_test_app/screens/authentication_screen.dart';
import 'package:firebase_test_app/screens/forget_password.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue, width: 2,
            ),
          ),
        ),
      ),
      initialRoute: AuthenticationScreen.routeName,
      routes: {
        AuthenticationScreen.routeName: (context)=>const AuthenticationScreen(),
        ForgetPasswordScreen.routeName: (context)=>  ForgetPasswordScreen(),

      },
    );
  }
}

