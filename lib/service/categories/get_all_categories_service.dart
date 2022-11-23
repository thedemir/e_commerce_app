import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/categories_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetAllCategoriesService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var token;
  var result;
  List<CategoriesModel>? categories;

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
      var result = CategoriesModel.fromJson(response.data);
      log("gelen response => ${response.data}");
      log("result => ${result.categories?[0].image}");
      return result.categories;
    } else {
      log(response.data);
      log("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
