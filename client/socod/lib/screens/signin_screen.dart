import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Consumer<AuthProvider>(
                        builder: (context, authProvider, _) => ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _isLoading = true;
                              });
                              var res = authProvider.signIn(
                                _email.text,
                                _password.text,
                              );
                              res.then(
                                (_) => {
                                  if (authProvider.resMessage() != null)
                                    {
                                      Fluttertoast.showToast(
                                        msg: authProvider.resMessage().toString(),
                                      ),
                                      setState(() => {_isLoading = false})
                                    }
                                },
                              );
                            },
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Container(
                              color: Theme.of(context).accentColor,
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                vertical: 15,
                                horizontal: 25,
                              ),
                              child: Center(
                                child: _isLoading
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

                  const SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () =>
                          {Navigator.pushNamed(context, '/signup-screen')},
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
      ),
    );
  }
}
