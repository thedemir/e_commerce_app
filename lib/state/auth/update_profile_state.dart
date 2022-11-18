import 'package:e_commerce_app/service/auth/update_profil_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileState extends ChangeNotifier {
  var service = UpdateProfileService();
  String? name;
  String? email;

  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    name = await prefs.getString("name").toString();
    print("get $name");
    notifyListeners();

    return name;
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    email = await prefs.getString("email").toString();
    print("get $name");
    notifyListeners();
    return email;
  }

  void fetch2() async {
    name = getEmail().toString();
    email = getName().toString();

    notifyListeners();
  }

  void fetch() async {
    service.updateProfile(
      name: name ?? "",
      email: email ?? "",
      password: password.text,
      password_confirmation: password_confirmation.text,
    );

    notifyListeners();
  }
}
