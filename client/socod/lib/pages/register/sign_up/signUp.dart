import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socod/common/values/colors.dart';
import 'package:socod/common/widgets/base_text_widget.dart';
import 'package:socod/pages/register/sign_up/bloc/signup_bloc.dart';
import 'package:socod/pages/register/sign_up/bloc/signup_event.dart';
import 'package:socod/pages/register/sign_up/bloc/signup_state.dart';
import 'package:socod/pages/register/sign_up/widgets/signup_widgets.dart';
import 'package:socod/pages/register/widgets/register_widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  List<String> InterestList = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              reusableText("Name", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              BuildTextField("Enter your name", "name", "user", (value) {
                context.read<SignUpBloc>().add(NameEvent(value));
              }),
              reusableText("Select your gender",
                  color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              GenderButton("Male", (value) {
                context.read<SignUpBloc>().add(GenderEvent(value));
              }),
              reusableText("Show Me", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              GenderButton("Female", (value) {
                context.read<SignUpBloc>().add(GenderInterestEvent(value));
              }),
              reusableText("Bio", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              BuildBioTextField((value) {
                context.read<SignUpBloc>().add(BioEvent(value));
              }),
              reusableText("Interest",
                  color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              BuildTextField("Your Hobbies", 'hobbies', "star", (value) {
                InterestList.add(value);
                context.read<SignUpBloc>().add(InterestEvent((InterestList)));
              }),
              reusableText("Mobile", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              BuildTextField("Enter your phone no", 'phoneno', "phone-call",
                  (value) {
                context.read<SignUpBloc>().add(PhoneEvent(value));
              }),
              reusableText("Email", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              BuildTextField("Enter your email", 'email', "user", (value) {
                context.read<SignUpBloc>().add(EmailEvent(value));
              }),
              reusableText("Password",
                  color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              BuildTextField("Enter your password", 'password', "lock",
                  (value) {
                context.read<SignUpBloc>().add(PasswordEvent(value));
              }),
              reusableText("Dept", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              ChooseDept('CSE', (value) {
                context.read<SignUpBloc>().add(DeptEvent(value));
              }),
              reusableText("Year", color: AppColors.primaryThreeElementText),
              SizedBox(height: 5.h),
              ChooseYear('1', (value) {
                context.read<SignUpBloc>().add(YearEvent(value));
              }),
              BuildLoginAndRegisterButton("Sign Up", "login", () {})
            ],
          ),
        ),
      );
    });
  }
}
