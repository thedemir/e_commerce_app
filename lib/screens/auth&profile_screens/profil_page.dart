import 'package:e_commerce_app/screens/auth&profile_screens/update_password_page.dart';
import 'package:e_commerce_app/state/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UpdateProfileState>(
      builder: (context, state, child) {
        return Scaffold(
          appBar: AppBar(
            leading: const Icon(
              Icons.abc,
              color: Colors.orange,
            ),
            elevation: 0,
            backgroundColor: Colors.orange,
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.orange,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 130),
                        child: CircleAvatar(
                          radius: 65,
                          child: Icon(
                            Icons.person,
                            size: 70,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(state.name ?? "",
                      style: TextStyle(color: Colors.black, fontSize: 29)),
                  const SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mail, color: Colors.grey, size: 18),
                      Text(
                        state.email ?? "",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        await state.service.updateProfile(
                          name: state.name ?? "",
                          email: state.email ?? "",
                          password: state.password.text,
                          password_confirmation:
                              state.password_confirmation.text,
                        );
                        state.password.clear();
                        state.password_confirmation.clear();
                      },
                      child: const Text(
                        "Şifre Değiştir",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
