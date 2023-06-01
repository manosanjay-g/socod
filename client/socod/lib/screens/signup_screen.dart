import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:socod/providers/auth_provider.dart';
import 'package:socod/validators/validators.dart';
import 'package:socod/widgets/signup_screen/bio_interests_field.dart';
import 'package:socod/widgets/signup_screen/dept_field.dart';
import 'package:socod/widgets/signup_screen/email_password_field.dart';
import 'package:socod/widgets/signup_screen/gender_field.dart';
import 'package:socod/widgets/signup_screen/name_field.dart';
import 'package:socod/widgets/signup_screen/otp_field.dart';
import 'package:socod/widgets/signup_screen/profile_image_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _count = 0;
  bool _isLoading = false;
  final List _pages = [
    NameField(isfilled:Validator.isNameFilled),
    GenderField(),
    DeptField(),
    const EmailPasswordField(),
    const BioInterestsField(),
    ProfileImageField(),
    const OTPField(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () => {
              if (_count == 0) {Navigator.of(context).pop()},
              setState(() => {
                    if (_count != 0) {_count = _count - 1}
                  })
            },
          ),
          title: const Text("Sign up"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pages[_count],
              _count < _pages.length - 1
                  ? Consumer<AuthProvider>(
                      builder: (context, authProvider, _) => ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () => {
                            setState(() {
                              if (_count < _pages.length - 1) {
                                if (_count == 5) {
                                  setState(() => {
                                        _isLoading = true,
                                      });
                                  var res = authProvider.signUp();
                                  res.then((value) {
                                    if (value != null) {
                                      if (value.statusCode != 200 &&
                                          value.statusCode != 201) {
                                        Fluttertoast.showToast(
                                            msg: jsonDecode(
                                                value.body)["message"]);
                                      } else {
                                        _count = _count + 1;
                                      }
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  });
                                } else if (_count == 0 &&
                                    authProvider.nameController.text.length > 0) {
                                    setState(() {
                                      Validator.isNameFilled = true;
                                    });
                                    NameField(isfilled:Validator.isNameFilled);
                                }
                                  _count = _count + 1;

                              }
                            }),
                          },
                          child: Container(
                            color: Theme.of(context).accentColor,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                            child: Center(
                              child: _isLoading == false
                                  ? const Text(
                                      "Next",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Consumer<AuthProvider>(
                      builder: (context, authProvider, _) => ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {
                            setState(() {
                              _isLoading = true;
                            });
                            authProvider.verifyOTP().then((value) {
                              if (value.statusCode == 200) {
                                Navigator.pop(context);
                                setState(() {
                                  _isLoading = false;
                                });
                              } else {
                                if (authProvider.resMessage() != null) {
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                    msg: authProvider.resMessage().toString(),
                                  );
                                }
                              }
                            });
                          },
                          child: Container(
                            color: Theme.of(context).accentColor,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 25,
                            ),
                            child: Center(
                              child: _isLoading == false
                                  ? const Text(
                                      "Finish",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : const CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                            ),
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
