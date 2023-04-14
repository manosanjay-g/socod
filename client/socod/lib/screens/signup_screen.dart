import 'package:flutter/material.dart';
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
  final List _pages = [
    const NameField(),
    GenderField(),
    DeptField(),
    const EmailPasswordField(),
    const BioInterestsField(),
    const ProfileImageField(),
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
                  ? GestureDetector(
                      onTap: () => {
                        setState(() {
                          if (_count < _pages.length - 1) {
                            _count = _count + 1;
                          }
                        })
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
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: () => {
                        Navigator.pop(context),
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
                          child: const Center(
                            child: Text(
                              "Finish",
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
    );
  }
}
