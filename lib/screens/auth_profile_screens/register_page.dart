import 'package:e_commerce_app/screens/general_screens/notification_page.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:e_commerce_app/state/auth/register_state.dart';
import 'package:e_commerce_app/state/auth/update_profile_state.dart';
import 'package:e_commerce_app/state/category/get_all_categories_state.dart';
import 'package:e_commerce_app/state/category/get_category_state.dart';
import 'package:e_commerce_app/state/product/get_all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/auth/check_email_state.dart';
import '../general_screens/primary_page.dart';
import 'check_email_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer6<RegisterState, CheckEmailState, UpdateProfileState,
          GetAllCategoriesState, GetCategoryState, GetAllProductsState>(
        builder:
            (context, state, state2, state3, state4, state5, state6, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 150),
                    child: Text(
                      "Kayıt Ol",
                      textScaleFactor: 3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextField(
                      controller: state.name,
                      decoration: InputDecoration(
                        hintText: "İsim",
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
                      controller:
                          TextEditingController(text: state2.email.text),
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "E posta",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: TextField(
                      controller: state.confirmPassword,
                      obscureText: true,
                      enableSuggestions: false,
                      autocorrect: false,
                      decoration: InputDecoration(
                        hintText: "Parola Tekrar",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 30),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 60,
                    width: 280,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (state.password.text != state.confirmPassword.text) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Kayıt Olunamadı"),
                                  content: Text(
                                      "Parola ve Parola Tekrarı eşleşmiyor"),
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
                        } else if (state.password.text == null ||
                            state.password.text.length < 6) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Giriş Yapılamadı"),
                                  content: Text(
                                      "Parola minimun 6 karakter içermelidir"),
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
                        } else if (state.password.text.length >= 6) {
                          await state.service.registerCall(
                              name: state.name.text,
                              email: state2.email.text,
                              password: state.confirmPassword.text,
                              passwordConfirmation: state.confirmPassword.text);

                          if (state.service.statuscode == true) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.orange),
                                );
                              },
                            );

                            state.fetch2();
                            state3.fetch2();
                            state.fetch2();
                            await state4.fetch();
                            await state6.fetch();
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => PrimaryPage()),
                            ),
                          );
                        }
                      },
                      child: const Text("İleri", textScaleFactor: 1.3),
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
          );
        },
      ),
    );
  }
}
