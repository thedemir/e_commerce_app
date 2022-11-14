import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/user_model.dart';
import 'package:flutter/rendering.dart';

class UpdateProfileService {
  var baseurl = "https://demoapi.webudi.tech/api/";

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
    Map<String, String> headers = {"Accept": "Application/json"};

    var response = await Dio().post("${baseurl}update-profile");

    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);
      log(jsonEncode(response.data));
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
