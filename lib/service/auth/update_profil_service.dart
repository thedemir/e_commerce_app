import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var token;
  var statuscode;

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print("get $token");
    return token;
  }

  Future<UserModel?> updateProfile(
      {required String name,
      required String email,
      required String password,
      required String password_confirmation}) async {
    Map<String, dynamic> loginJson = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation
    };
    var token2 = await getToken();
    print("update   ${token2.toString()}");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Accept": "Application/json,",
      'Authorization': 'Bearer $token2',
    };
    var response = await Dio().post(
      "${baseurl}update-profile",
      data: loginJson,
      options: Options(headers: headers),
    );
    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);

      statuscode = result.status;
      log(jsonEncode(response.data));
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
