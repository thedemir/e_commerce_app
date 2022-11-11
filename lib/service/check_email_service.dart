import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:e_commerce_app/model/check_email_model.dart';
import 'package:e_commerce_app/model/user_model.dart';

class CheckEmailService {
  var baseurl = "https://demoapi.webudi.tech/api/";
  var statuscode;

  Future<UserModel?> checkEmailCall({required String email}) async {
    Map<String, dynamic> checkEmailjson = {"email": email};
    Map<String, String> headers = {"Accept": "Application/json"};

    var response = await Dio().post("${baseurl}check-user",
        data: checkEmailjson, options: Options(headers: headers));

    if (response.statusCode == 200) {
      var result = UserModel.fromJson(response.data);
      log(jsonEncode(response.data));
      statuscode = result.registerstatus;

      log("in service log > ${statuscode}");
      return result;
    } else {
      log(response.data);
      print("Bir sorun oluştu ${response.statusCode}");
    }
  }
}
