import 'package:e_commerce_app/state/log_in_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LogInState>(
        builder: (context, state, child) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 150),
                    child: Text(
                      "Giriş Yap",
                      textScaleFactor: 3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: state.email,
                    decoration: InputDecoration(
                      hintText: "E posta",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(width: 30),
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: TextField(
                      controller: state.password,
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
                            email: state.email.text,
                            password: state.password.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => HomePage()),
                          ),
                        );
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
