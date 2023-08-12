import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socod/common/values/colors.dart';
import 'package:socod/common/widgets/base_text_widget.dart';
import 'package:socod/pages/register/sign_in/bloc/signin_bloc.dart';
import 'package:socod/pages/register/sign_in/bloc/signin_event.dart';
import 'package:socod/pages/register/sign_in/bloc/signin_state.dart';
import 'package:socod/pages/register/sign_in/signin_controller.dart';
import 'package:socod/pages/register/sign_in/widgets/signIn_widgets.dart';
import 'package:socod/pages/register/widgets/register_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(builder: (context, state) {
      return Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            alignment: Alignment.center,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

              reusableText("Email", color: AppColors.primaryThreeElementText),
              SizedBox(
                height: 5.h,
              ),
              BuildTextField("Enter your Email", "email", "user", (value) {
                context.read<SignInBloc>().add(EmailEvent(value));
              }),
              SizedBox(
                height: 20.h,
              ),
              reusableText("Password", color: AppColors.primaryThreeElementText),
              SizedBox(
                height: 5.h,
              ),
              BuildTextField("Enter your Password", "password", "lock", (value) {
                context.read<SignInBloc>().add(PasswordEvent(value));
              }),
              SizedBox(height: 5.h),
              BuildLoginAndRegisterButton("Log In", "login", () {
                print("Login called");
                SignInController(context: context).handleSignIn();
              }),
              BuildLoginAndRegisterButton("Sign Up", "signup", () {})
            ]),
          ),
        ),
      );
    });
  }
}
