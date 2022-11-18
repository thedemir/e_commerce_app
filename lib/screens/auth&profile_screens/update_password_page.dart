import 'package:e_commerce_app/screens/auth&profile_screens/profil_page.dart';
import 'package:e_commerce_app/state/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../state/auth/update_profile_state.dart';

class UpdatePasswordPage extends StatefulWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordPage> createState() => _UpdaatePasswordPageState();
}

class _UpdaatePasswordPageState extends State<UpdatePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.chevron_left_rounded)),
            title: Text(
              "Şifre Değiştir",
              style: TextStyle(color: Colors.orange),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: TextEditingController(),
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Mevcut Şifre",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 30),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0),
                child: TextField(
                  controller: state.password,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Yeni Şifre",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 30),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: TextField(
                  controller: state.password_confirmation,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Yeni Şifre Tekrar",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(width: 30),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                width: 280,
                child: ElevatedButton(
                  onPressed: () async {
                    await state.service.updateProfile(
                      name: state.name ?? "",
                      email: state.email ?? "",
                      password: state.password.text,
                      password_confirmation: state.password_confirmation.text,
                    );
                  },
                  child: const Text("Şifre Değiştir", textScaleFactor: 1.3),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
