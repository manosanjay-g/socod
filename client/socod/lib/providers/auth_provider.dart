import 'dart:async';
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  String? _resMessage;

  String? token() => _token;
  String? userId() => _userId;
  String? resMessage() => _resMessage;

  //Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  String? genderController = "Male";
  String? genderInterestController = "Female";
  String? deptController = "AIML";
  String? yearController = "1st";
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  XFile? image;

  void setImage(XFile? img) {
    image = img;
    notifyListeners();
  }

  void setGender(String? newGender) {
    genderController = newGender;
    if (genderController == "Male") {
      genderInterestController = "Female";
    } else {
      genderInterestController = "Male";
    }
    notifyListeners();
  }

  void setDept(String? newDept) {
    deptController = newDept;
    notifyListeners();
  }

  void setYear(String? newYear) {
    yearController = newYear;
    notifyListeners();
  }

  Future signUp() async {
    final json = jsonEncode({
      "name": nameController.text,
      "gender": genderController,
      "gender_interest": genderInterestController,
      "bio": bioController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "dept_id": deptController,
      "year": yearController,
      "roles": [8421],
    });

    final url = Uri.parse("http://10.0.2.2:8000/auth/register");
    http.Response res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json,
    );

    _userId = jsonDecode(res.body)["res"];
    if (res.statusCode != 200 || res.statusCode != 201) {
      _resMessage = jsonDecode(res.body)["message"];
    }

    final otpJson = jsonEncode({
      "user_id": _userId,
      "email": emailController.text,
    });
    final otpUrl = Uri.parse("http://10.0.2.2:8000/verification/sendotp/");

    http.Response otpResponse = await http.put(
      otpUrl,
      headers: {"Content-Type": "application/json"},
      body: otpJson,
    );

    print(res.body);
    print(otpResponse.body);
    notifyListeners();
    return res;
  }

  Future verifyOTP(String otp) async {
    final json = jsonEncode({"user_id": _userId, "otp": otp});
    final url = Uri.parse("http://10.0.2.2:8000/verification/verifyotp/");

    http.Response res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json,
    );

    if (res.statusCode == 200) {
      _userId = jsonDecode(res.body)["res"]["id"];
      _token = jsonDecode(res.body)["res"]["token"];
    } else {
      _resMessage = jsonDecode(res.body)["message"];
    }

    notifyListeners();
    return res;
  }

  Future signIn(String email, String password) async {
    _resMessage = null;
    final json = jsonEncode({
      "email": email,
      "password": password,
    });
    if (!email.contains('@')) {
      _resMessage = "Enter a valid email address";
      return json;
    } else if (password.length < 8) {
      _resMessage = "Password should be more than or equal to 8 characters ";
    }
    final url = Uri.parse("http://10.0.2.2:8000/auth/login");

    http.Response res = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json,
    );
    if (res.statusCode == 200) {
      _userId = jsonDecode(res.body)["_id"];
      _token = jsonDecode(res.body)["token"];
    } else {
      _resMessage = jsonDecode(res.body)["message"];
    }

    notifyListeners();
    return res;
  }

  void signOut() {
    _token = null;
    _userId = null;
    notifyListeners();
  }
}
