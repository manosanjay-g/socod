import 'package:flutter/cupertino.dart';

class Global{
  // static late StorageService storageService;
  static Future init() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer=MyGlobalObserver();
  // await Firebase.initializeApp();

  // storageService = await StorageService().init();
    
  }
}