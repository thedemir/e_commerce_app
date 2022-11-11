import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/login_model.dart';

class Service {
  var baseurl = "https://demoapi.webudi.tech/api/";

  Future<LogInModel?> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {"email": email, "password": password};
    Map<String, String> headers = {"Accept": "Application/json"};

    var response = await Dio().post("${baseurl}login",
        data: json, options: Options(headers: headers));

    if (response.statusCode == 200) {
      var result = LogInModel.fromJson(response.data);
      log(jsonEncode(response.data));
      return result;
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
