import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/get_category_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetCategoryService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var token;
  var result;

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString("token").toString();
    print("get $token");
    return token;
  }

  Future getCategory(int id) async {
    var token = await getToken();

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Accept": "Application/json,",
      'Authorization': 'Bearer $token',
    };

    var response = await Dio()
        .get("${baseurl}categories/$id", options: Options(headers: headers));

    if (response.statusCode == 200) {
      var result = ProductModel.fromJson(response.data);

      log("gelen response => ${response.data}");
      log("result => ${result.products?.data?[0].image}");

      return result.products?.data;
    } else {
      log(response.data);
      log("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
