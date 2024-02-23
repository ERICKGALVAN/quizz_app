import 'package:flutter/material.dart';
import 'package:quizz_app/auth/presentation/screens/login_screen.dart';
import 'package:quizz_app/home/presentation/screens/home.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
    );
  }
}
