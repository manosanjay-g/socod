import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'common/routes/routes.dart';
import 'common/values/colors.dart';
import 'global.dart';

Future<void> main() async {
  await Global.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[...AppPages.allBlocProviders(context)],
      // AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: (context,child)=> MaterialApp(
      title: 'Socod',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: AppColors.primaryText
          ),
          backgroundColor: Colors.white,
          elevation: 0
        )
      ),
      // home: ApplcationPage(),
      onGenerateRoute: AppPages.GenerateRouteSettings,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      
      // routes: {
      //   // "myHomePage":(context)=>MyHomePage(),
      //   "signIn":(context)=>SignIn(),
      //   "register":(context)=>Register()
      // },
    ),)
    );
  }
}
  

