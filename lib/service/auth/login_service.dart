import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var statuscode;
  // shared preferences db

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
    print(token);
  }

  saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
    print(name);
  }

  saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
    print(email);
  }

  Future<UserModel?> loginCall(
      {required String email, required String password}) async {
    Map<String, dynamic> loginJson = {"email": email, "password": password};
    Map<String, String> headers = {"Accept": "Application/json"};

    var response = await Dio().post("${baseurl}login",
        data: loginJson, options: Options(headers: headers));
    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);
      //-------------------------------
      saveToken(result.token.toString());
      saveName(result.user!.name.toString());
      saveEmail(result.user!.email.toString());
      //--------------------------------
      log(jsonEncode(response.data));
      statuscode = result.status;
      return result;
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
