import 'package:e_commerce_app/service/auth/register_service.dart';
import 'package:flutter/cupertino.dart';

class RegisterState extends ChangeNotifier {
  var service = RegisterService();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  void fetch() async {
    await service.registerCall(
        name: name.text,
        email: email.text,
        password: password.text,
        passwordConfirmation: confirmPassword.text);
  }
}
