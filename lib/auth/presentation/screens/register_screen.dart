import 'package:flutter/material.dart';
import 'package:quizz_app/auth/data/datasources/auth_service.dart';
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 39, 223),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
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
                    key: _formKey,
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
                        TextFormField(
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'El username es obligatorio';
                            }
                            return null;
                          },
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'La contraseña es requerida';
                            }
                            return null;
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirmar contraseña es requerido';
                            }
                            if (value != _passwordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
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
                            if (_formKey.currentState?.validate() ?? false) {
                              AuthService().register(
                                username: _usernameController.text,
                                password: _passwordController.text,
                              );
                            }
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
      ),
    );
  }
}
