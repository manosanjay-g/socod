import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class EmailPasswordField extends StatefulWidget {
  const EmailPasswordField({super.key});

  @override
  State<EmailPasswordField> createState() => _EmailPasswordFieldState();
}

class _EmailPasswordFieldState extends State<EmailPasswordField> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const Text(
              "Enter your Details",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) => TextField(
                controller: authProvider.emailController,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  hintText: "REC Email",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) => TextField(
                controller: authProvider.passwordController,
                obscureText: _obscurePassword,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    splashRadius: 1,
                    color: Colors.white,
                    onPressed: () => {
                      setState(() {
                        _obscurePassword = !(_obscurePassword);
                      }),
                    },
                    icon: _obscurePassword
                        ? const Icon(
                            Icons.remove_red_eye,
                          )
                        : const Icon(Icons.visibility_off),
                  ),
                  hintText: "Password of your choice",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Consumer<AuthProvider>(
              builder: (context, authProvider, _) => TextField(
                controller: authProvider.confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    splashRadius: 1,
                    color: Colors.white,
                    onPressed: () => {
                      setState(() {
                        _obscureConfirmPassword = !(_obscureConfirmPassword);
                      }),
                    },
                    icon: _obscureConfirmPassword
                        ? const Icon(
                            Icons.remove_red_eye,
                          )
                        : const Icon(Icons.visibility_off),
                  ),
                  hintText: "Confirm Password",
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ],
    );
  }
}
