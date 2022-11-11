import 'package:e_commerce_app/service/check_email_service.dart';
import 'package:flutter/cupertino.dart';

class CheckEmailState extends ChangeNotifier {
  var service = CheckEmailService();

  TextEditingController email = TextEditingController();

  void fetch() async {
    await service.checkEmailCall(email: email.text);
  }
}
