import 'dart:developer';
import 'package:e_commerce_app/service/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogInState extends ChangeNotifier {
  var service = LoginService();
  var statuscode;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print(token);
  }

  void fetch() async {
    await service.loginCall(email: email.text, password: password.text);
  }
}
