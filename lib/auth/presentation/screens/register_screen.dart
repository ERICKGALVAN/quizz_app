import 'package:flutter/material.dart';
import 'package:quizz_app/auth/presentation/screens/login_screen.dart';
import 'package:quizz_app/auth/presentation/widgets/password_textfield.dart';
import 'package:quizz_app/config/routes/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
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
                child: Form(
                  child: Column(
                    children: [
                      const Text(
                        'Registrate',
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
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextfield(
                        controller: _confirmPasswordController,
                        isPasswordVisible: _isConfirmPasswordVisible,
                        hintText: 'Confirmar contraseña',
                        onPressed: () {
                          setState(
                            () {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            },
                          );
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
                        onPressed: () {
                          print(_usernameController.text);
                        },
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
                            const LoginScreen(),
                          );
                        },
                        child: const Text(
                          'Ya tengo una cuenta',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
