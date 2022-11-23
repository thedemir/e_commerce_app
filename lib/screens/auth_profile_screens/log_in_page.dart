import 'dart:developer';

import 'package:e_commerce_app/screens/auth_profile_screens/check_email_page.dart';
import 'package:e_commerce_app/service/categories/all_categories_service.dart';
import 'package:e_commerce_app/state/auth/check_email_state.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:e_commerce_app/state/auth/update_profile_state.dart';
import 'package:e_commerce_app/state/categories/all_categories_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../primary_page.dart';

class LogInPage extends StatefulWidget {
  LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer4<LogInState, CheckEmailState, UpdateProfileState,
          GetAllCategoriesState>(
        builder: (context, state, state2, state3, state4, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 150),
                    child: Text(
                      "Giriş Yap",
                      textScaleFactor: 3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: TextEditingController(text: state2.email.text),
                    readOnly: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 50, color: Colors.orange),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: TextField(
                      controller: state.password,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Parola",
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
                        await state.service.loginCall(
                            email: state2.email.text,
                            password: state.password.text);

                        state3.fetch2();
                        state.fetch2();
                        await state4.fetch();

                        if (state.service.statuscode == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => PrimaryPage()),
                            ),
                          );
                        } else if (state.service.statuscode == false) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                state.fetch();

                                return AlertDialog(
                                  title: Text("Parola Hatalı"),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    CheckEmailPage()),
                                              ),
                                            ),
                                        child: Text("Farklı Bir E posta")),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text("Tekrar Dene"))
                                  ],
                                );
                              });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Parola Gereklidir"),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: ((context) =>
                                                    CheckEmailPage()),
                                              ),
                                            ),
                                        child: Text("Farklı Bir E posta")),
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text("Tekrar Dene"))
                                  ],
                                );
                              });
                        }
                      },
                      child: const Text("Giriş Yap", textScaleFactor: 1.3),
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
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => CheckEmailPage()),
                            ),
                          ),
                      child: Text("Farklı bir kullanıcı ile giriş yap"))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
