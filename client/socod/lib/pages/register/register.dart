import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:socod/common/widgets/base_text_widget.dart';
import 'package:socod/pages/register/sign_in/signIn.dart';
import 'package:socod/pages/register/sign_up/signUp.dart';

import '../../common/values/colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.primaryText
          ),
          backgroundColor: Colors.white,
          elevation: 0
        )
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child:Scaffold(
          appBar: AppBar(
            toolbarHeight:10,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: DecoratedBox(
                decoration:BoxDecoration(
                    border: Border(bottom: BorderSide(width: 2.h,color: AppColors.primaryFourElementText))
                ), 
                child: TabBar(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  unselectedLabelColor: AppColors.primaryThreeElementText,
                  labelColor: Colors.black,
                  indicatorColor: Colors.purple,
                  splashBorderRadius: BorderRadius.circular(5),
                  labelPadding: EdgeInsets.only(bottom: 8.h),
                  indicatorWeight: 3.h,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs:[
                    Text("Log In",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                          
                    ),
                    ),
                    Text("Sign Up",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight:FontWeight.bold 
                    ),
                    ),              ] ,
                  ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
               SignIn(),
               SignUp()
            ]
            ),
        )
        ),

    );
  }
  
}