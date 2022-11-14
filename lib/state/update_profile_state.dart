import 'package:e_commerce_app/service/update_profil.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateState extends ChangeNotifier {
  var service = UpdateProfileService();
  late String name;
  late String email;

  TextEditingController password = TextEditingController();
  TextEditingController password_confirmation = TextEditingController();

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    String name = await prefs.getString("name").toString();
    return name;
  }

  getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    String email = await prefs.getString("email").toString();
    return email;
  }

  void fetch() async {
    name = getName();
    email = getEmail();

    await service.updateProfile(
        name: name,
        email: email,
        password: password.text,
        password_confirmation: password_confirmation.text);
  }
}
