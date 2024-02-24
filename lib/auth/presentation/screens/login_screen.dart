import 'package:flutter/material.dart';
import 'package:quizz_app/auth/presentation/screens/register_screen.dart';
import 'package:quizz_app/auth/presentation/widgets/password_textfield.dart';
import 'package:quizz_app/config/routes/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 39, 223),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(
                  20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Bienvenido',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    PasswordTextfield(
                      controller: _passwordController,
                      isPasswordVisible: _isPasswordVisible,
                      onPressed: () {
                        _isPasswordVisible = !_isPasswordVisible;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 114, 191, 253),
                        foregroundColor: Colors.black,
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Ingresar',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        navigateAndRemove(
                          context,
                          const RegisterScreen(),
                        );
                      },
                      child: const Text(
                        'No tengo una cuenta',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
