import 'package:e_commerce_app/service/login_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogInState extends ChangeNotifier {
  var service = Service();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void fetch() async {
    await service.loginCall(email: email.text, password: password.text);
  }
}
