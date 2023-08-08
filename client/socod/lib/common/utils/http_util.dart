import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../global.dart';
import '../values/constants.dart';

class HttpUtil{
  static final HttpUtil _instance= HttpUtil._internal();
  factory HttpUtil(){
    return _instance;
  }
  late Dio dio;
  HttpUtil._internal(){
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.SERVER_API_URL,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
      headers: {
      },
      contentType: "application/json; charset=UTF-8",
      responseType: ResponseType.json
    );
    dio= Dio(options);
  }

  // Future post(String path,{dynamic data,Map<String,dynamic>? queryParameters,Options? options}) async {
  //   Options requestOptions =options??Options();
  //   requestOptions.headers=requestOptions.headers??{};
  //   // Map<String,dynamic>? authorization = getAuthorization();
  //   // if(authorization!=null){
  //   //   requestOptions.headers!.addAll(authorization);
  //   // }
  //   try {
  //     var response = await dio.post(
  //     path,
  //     data: data,
  //     queryParameters: queryParameters,
  //     options: requestOptions
  //     );
  //   print("-----Response ${response}");
  //   return response.data;}
  //   catch(e){
  //     print("Error retrieving data $e");
  //   }
    

  // }
  // Map<String,dynamic>? getAuthorization(){
  //   var headers=<String,dynamic>{};
  //   var access_token = Global.storageService.getUserToken();
  //   if(access_token.isNotEmpty){
  //     headers['Authorization']='Bearer $access_token';
  //   }
  //   return headers;

  // }
  Future<http.Response> post() {
  return http.post(
    Uri.parse('http://10.0.2.2:8000/auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': '200701148@rajalakshmi.edu.in',
      'password':'I@mgroot2506'
    }),
  );
}

}