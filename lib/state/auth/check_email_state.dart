import 'dart:developer';

import 'package:e_commerce_app/service/auth/check_email_service.dart';
import 'package:flutter/cupertino.dart';

class CheckEmailState extends ChangeNotifier {
  var service = CheckEmailService();
  var statuscode;

  TextEditingController email = TextEditingController();

  void fetch() async {
    await service.checkEmailCall(email: email.text);
    statuscode = service.statuscode;

    log("in state log > ${statuscode}");

    notifyListeners();
  }
}
