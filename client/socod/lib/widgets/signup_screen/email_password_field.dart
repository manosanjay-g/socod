import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class EmailPasswordField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const EmailPasswordField({super.key, required this.formKey});

  @override
  State<EmailPasswordField> createState() => _EmailPasswordFieldState();
}

class _EmailPasswordFieldState extends State<EmailPasswordField> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  late Color emailColor, passwordColor;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
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
          Consumer<AuthProvider>(builder: (context, authProvider, _) {
            Future.delayed(Duration(milliseconds: 5), () {
              if (authProvider.emailController.text.isEmpty ||
                  !authProvider.emailController.text.contains("@") ||
                  !authProvider.emailController.text
                      .contains("rajalakshmi.edu.in")) {
                setState(() {
                  emailColor = Colors.red;
                });
              }else{
                setState(() {
                  emailColor = Colors.white;
                });
              }
            });
            return TextFormField(
              controller: authProvider.emailController,
              cursorColor: Colors.white,
              validator: (val) {
                if (val!.isEmpty) {
                  return "email is needed";
                }
                if (!val.contains("@")) {
                  return "enter a vail email";
                }
                if (!val.contains("rajalakshmi.edu.in")) {
                  return "enter Rec email";
                }
              },
              decoration:  InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: emailColor,
                  ),
                ),
                hintText: "REC Email",
                border: OutlineInputBorder(),
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Consumer<AuthProvider>(builder: (context, authProvider, _) {
            Future.delayed(Duration(milliseconds: 5), () {
              if (authProvider.passwordController.text!.isEmpty ||
                  authProvider.passwordController.text!.length < 4 ||
                  authProvider.passwordController.text!.length > 8) {
                setState(() {
                  passwordColor = Colors.red;
                });
              }else{
                setState(() {
                  passwordColor = Colors.white;
                });
              }
            });
            return TextFormField(
              controller: authProvider.passwordController,
              obscureText: _obscurePassword,
              cursorColor: Colors.white,
              validator: (val) {
                if (val!.isEmpty || val!.length < 4 || val!.length > 8) {
                  return "the password must be greater than 4 chars and lesser than 8 chars";
                }
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: passwordColor,
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
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Consumer<AuthProvider>(
            builder: (context, authProvider, _) => TextFormField(
              controller: authProvider.confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              cursorColor: Colors.white,
              validator: (val){
                if(val != authProvider.passwordController.text){
                  return "pass word miss match";
                }
              },
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
    );
  }
}
