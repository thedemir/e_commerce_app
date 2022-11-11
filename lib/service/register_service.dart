import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/login_model.dart';

import '../model/user_model.dart';

class RegisterService {
  var baseurl = "https://demoapi.webudi.tech/api/";

  Future<UserModel?> registerCall(
      {required String name,
      required String email,
      required String password,
      required String passwordConfirmation}) async {
    Map<String, dynamic> registerJson = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password
    };
    Map<String, dynamic> headers = {"Accept": "Application/json"};

    var response = await Dio().post("${baseurl}register",
        data: registerJson, options: Options(headers: headers));
    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);
      log(jsonEncode(response.data));
      return result;
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
