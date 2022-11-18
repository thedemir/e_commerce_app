import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCategoriesService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var token;

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print("get $token");
    return token;
  }

  Future<CategoriesModels?> getAllCategories() async {
    var token = await getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Accept": "Application/json,",
      'Authorization': 'Bearer $token',
    };
    var response = await Dio()
        .get("${baseurl}categories", options: Options(headers: headers));

    if (response.statusCode == 200) {
      var result = CategoriesModels.fromJson(response.data);
      log(jsonEncode(response.data));
      return result;
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
