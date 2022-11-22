import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/state/categories/all_categories_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllCategoriesService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var token;
  var result;
  List<CategoriesModels>? categories;

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print("get $token");
    return token;
  }

  Future getAllCategories() async {
    var token = await getToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Accept": "Application/json,",
      'Authorization': 'Bearer $token',
    };
    var response = await Dio()
        .get("${baseurl}categories", options: Options(headers: headers));

    if (response.statusCode == 200) {
      result = CategoriesModels.fromJson(response.data);
      if (result is List) {
        categories = await result.map((e) => CategoriesModels.fromJson(e));
        return categories;
      }

      log(jsonEncode(response.data));
      return result;
    } else {
      log(response.data);
      log("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
