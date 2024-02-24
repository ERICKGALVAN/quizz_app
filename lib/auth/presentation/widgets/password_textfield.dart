import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {
  const PasswordTextfield({
    Key? key,
    required this.isPasswordVisible,
    required this.onPressed,
    this.hintText,
    required this.controller,
  }) : super(key: key);
  final bool isPasswordVisible;
  final void Function() onPressed;
  final String? hintText;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isPasswordVisible,
      decoration: InputDecoration(
        hintText: hintText ?? 'Password',
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
    );
  }
}
