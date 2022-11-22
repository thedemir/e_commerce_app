import 'dart:developer';
import 'package:e_commerce_app/service/auth/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInState extends ChangeNotifier {
  var service = LoginService();
  var statuscode;
  var token;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print("get $token");
    notifyListeners();
    return token;
  }

  Future<String?> delToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print("get $token");
    notifyListeners();
  }

  Future<String?> logOut() async {
    delToken();
    email.clear();
    password.clear();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    print("get $token");
    notifyListeners();
  }

  void fetch2() {
    token = getToken().toString();
  }

  void fetch() async {
    await service.loginCall(email: email.text, password: password.text);
  }
}
