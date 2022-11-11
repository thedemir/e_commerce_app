import 'package:e_commerce_app/state/check_email_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CheckEmailState>(
        builder: (context, state, child) {
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
                      "Giriş Yap",
                      textScaleFactor: 3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: TextField(
                      controller: state.email,
                      decoration: InputDecoration(
                        hintText: "E posta",
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
                        await state.service
                            .checkEmailCall(email: state.email.text);
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
