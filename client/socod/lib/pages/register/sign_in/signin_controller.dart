import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:socod/common/apis/userapi.dart';
import 'package:socod/common/entities/user.dart';
import 'package:socod/common/widgets/flutter_toast.dart';
import 'package:socod/pages/register/sign_in/bloc/signin_bloc.dart';

class SignInController{
  final BuildContext context;

  SignInController({required this.context});

  Future<void> handleSignIn()async{

    final state = context.read<SignInBloc>().state;
    String email = state.email;
    String password = state.password;
    if(email.isEmpty){
      toastInfo(msg: "Fill in your email");
      return;
    }
    if(password.isEmpty){
      toastInfo(msg: "Fill in your password");
      return;
    }
    try{
      LoginRequestEntity loginRequestEntity = LoginRequestEntity();
      loginRequestEntity.email=email;
      loginRequestEntity.password=password;
      asyncPostAllData(loginRequestEntity);
      


      
    }catch(e){
      print("Some error occured");

    }
  }
    Future<void> asyncPostAllData(LoginRequestEntity loginRequestEntity) async{
      EasyLoading.show(
        indicator: CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true
      );
      try{
        var result = await UserAPI.login();
        if(result.code==200){
          EasyLoading.dismiss();
          print(result);
        }

      }catch(e){
        print(e.toString());
      }
    }
  
}