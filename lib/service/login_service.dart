import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/user_model.dart';

class LoginService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var statuscode;

  Future<UserModel?> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> loginJson = {"email": email, "password": password};
    Map<String, String> headers = {"Accept": "Application/json"};

    var response = await Dio().post("${baseurl}login",
        data: loginJson, options: Options(headers: headers));

    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);
      log(jsonEncode(response.data));
      statuscode = result.status;

      return result;
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
