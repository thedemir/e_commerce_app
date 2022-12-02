import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/user_model.dart';

class RegisterService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var statuscode;

  // shared preferences db

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }

  saveName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  saveEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
  }

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
      //-------------------------------
      if (result.status == true) {
        saveToken(result.token.toString());
        saveName(result.user!.name.toString());
        saveEmail(result.user!.email.toString());
      }
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
