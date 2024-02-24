import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizz_app/auth/presentation/providers/auth_provider.dart';
import 'package:quizz_app/auth/presentation/screens/login_screen.dart';
import 'package:quizz_app/home/presentation/screens/home.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLogged = ref.watch(authProvider);
    return MaterialApp(
      home: isLogged.when(
        data: (isAuth) {
          if (isAuth) {
            return const HomeScreen();
          } else {
            return const LoginScreen();
          }
        },
        error: (error, stacktrace) {
          return const LoginScreen();
        },
        loading: () {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
