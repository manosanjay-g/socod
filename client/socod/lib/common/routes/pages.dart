import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socod/common/routes/names.dart';
import 'package:socod/pages/register/register.dart';
import 'package:socod/pages/register/sign_in/bloc/signin_bloc.dart';
import 'package:socod/pages/register/sign_up/bloc/signup_bloc.dart';
import 'package:socod/pages/register/sign_up/signUp.dart';

import '../../pages/register/sign_in/signIn.dart';

class AppPages{
  static List<PageEntity> routes(){
    return [
      PageEntity(
        route: AppRoutes.SIGN_IN,
         page: SignIn(),
         bloc:BlocProvider(create: (_)=>SignInBloc())
         ),
         PageEntity(
          route: AppRoutes.REGISTER,
           page: SignUp(),
           bloc: BlocProvider(create:(_)=>SignUpBloc() ,)
           )
    

  ];
  }

  static List<dynamic> allBlocProviders(BuildContext context){
  List<dynamic> blocProviders = <dynamic>[];
  for(var bloc in routes()){
    blocProviders.add(bloc.bloc);
    
  }
  // print(blocProviders);
  return blocProviders;

}

static MaterialPageRoute GenerateRouteSettings(RouteSettings settings){
  if(settings.name!=null){
    var result = routes().where((element) => element.route==settings.name);
    if(result.isNotEmpty){
         return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);
      }
     
    }
    return MaterialPageRoute(builder: (_)=>const Register(),settings:settings);

}
}

class PageEntity{
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route,required this.page,this.bloc});

}
