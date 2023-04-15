import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  String? _errorMessage;
  bool _isLoading = false;

  String? token() => _token;
  String? userId() => _userId;
  String? errorMessage() => _errorMessage;
  bool isLoading() => _isLoading;

  Future signUp(String email, String password) async {}
  Future signIn(String email, String password) async {
    _errorMessage = null;
    _isLoading = true;
    final json = {
      "email": email,
      "password": password,
    };

    final url = Uri.parse("http://10.0.2.2:8000/auth/login");

    http.Response res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(json),
    );
    if (res.statusCode == 200) {
      _userId = jsonDecode(res.body)["_id"];
      _token = jsonDecode(res.body)["token"];
    } else {
      _errorMessage = jsonDecode(res.body)["error"];
    }
    _isLoading = false;

    notifyListeners();
  }

  void signOut() {
    _token = null;
    _userId = null;
    notifyListeners();
  }
}
