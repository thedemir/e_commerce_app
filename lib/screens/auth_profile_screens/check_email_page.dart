import 'package:e_commerce_app/screens/auth_profile_screens/log_in_page.dart';
import 'package:e_commerce_app/screens/auth_profile_screens/register_page.dart';
import 'package:e_commerce_app/state/auth/check_email_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CheckEmailState>(
        builder: (context, state, child) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 120),
                    Icon(
                      Icons.shopping_basket,
                      color: Colors.orange,
                      size: 140,
                    ),
                    SizedBox(height: 75),
                    const Padding(
                      padding: EdgeInsets.only(right: 240),
                      child: Text("E Posta",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 35)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: state.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E posta",
                        hintText: "E posta",
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(width: 30),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 60,
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (state.email.text.isEmpty ||
                              !state.email.text.contains("@")) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Hatalı E Posta"),
                                    content: Text(
                                        "Doğru formatta E posta adresi giriniz."),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: Text("Tekrar Dene"))
                                    ],
                                  );
                                });
                          } else if (state.email.text.isNotEmpty) {
                            await state.service
                                .checkEmailCall(email: state.email.text);

                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                        color: Colors.orange),
                                  );
                                });

                            Navigator.of(context).pop();

                            if (state.service.statuscode == true) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => LogInPage()),
                                ),
                              );
                            } else if (state.service.statuscode == false) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => RegisterPage()),
                                ),
                              );
                            }
                          }
                          ;
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
            ),
          );
        },
      ),
    );
  }
}
