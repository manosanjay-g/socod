import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socod/providers/auth_provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text(
                      "SOCOD",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _email,
                      cursorColor: Colors.white,
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: "Email",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _password,
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
                              : const Icon(
                                  Icons.visibility_off,
                                ),
                        ),
                        hintText: "Password",
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, _) => Container(
                        child: authProvider.errorMessage() != null
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(authProvider.errorMessage().toString()),
                                ],
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Consumer<AuthProvider>(
                      builder: (context, authProvider, _) => GestureDetector(
                        onTap: () => {
                          authProvider.signIn(
                            _email.text,
                            _password.text,
                          ),
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            color: Theme.of(context).accentColor,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                            child: Center(
                              child: authProvider.isLoading()
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => {Navigator.pushNamed(context, '/signup-screen')},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      color: Theme.of(context).accentColor,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 25,
                      ),
                      child: const Center(
                        child: Text(
                          "Create an Account",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
