import 'package:e_commerce_app/service/auth/register_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterState extends ChangeNotifier {
  var service = RegisterService();
  var token;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print("get $token");
    notifyListeners();
    return token;
  }

  void fetch() async {
    await service.registerCall(
        name: name.text,
        email: email.text,
        password: password.text,
        passwordConfirmation: confirmPassword.text);
  }

  void fetch2() {
    token = getToken().toString();
    print(token);
  }
}
