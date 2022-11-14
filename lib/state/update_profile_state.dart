import 'package:e_commerce_app/service/update_profil_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileState extends ChangeNotifier {
  var service = UpdateProfileService();
  String? name;
  String? email;

  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    String name = await prefs.getString("name").toString();
    notifyListeners();
    return name;
  }

  getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString("email").toString();
    notifyListeners();
    return email;
  }

  void fetch() async {
    await service.updateProfile(
        name: name ?? "",
        email: email ?? "",
        password: password.text,
        password_confirmation: password_confirmation.text);

    name = getName();
    email = getEmail();
    notifyListeners();
  }
}
