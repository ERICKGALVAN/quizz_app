import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quizz_app/auth/presentation/providers/auth_screens_provider.dart';
import 'package:quizz_app/auth/presentation/screens/login_screen.dart';
import 'package:quizz_app/auth/presentation/screens/register_screen.dart';

class AuthScreens extends ConsumerWidget {
  const AuthScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = ref.watch(authScreensProvider);
    return screen == AuthScreensEnum.login
        ? const LoginScreen()
        : const RegisterScreen();
  }
}
