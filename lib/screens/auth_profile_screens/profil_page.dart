import 'package:e_commerce_app/screens/auth_profile_screens/update_password_page.dart';
import 'package:e_commerce_app/state/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/auth/update_profile_state.dart';

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
                  const SizedBox(height: 10),
                  Text(
                    state.name ?? "",
                    style: GoogleFonts.lato(color: Colors.black, fontSize: 33),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mail, color: Colors.grey, size: 18),
                      SizedBox(width: 4),
                      Text(
                        state.email ?? "",
                        style: GoogleFonts.lato(color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 45),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
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
                              prefixIcon: Icon(Icons.key_rounded),
                              hintText: "Yeni Parola",
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
                              prefixIcon: Icon(Icons.key_rounded),
                              hintText: "Yeni Parola Tekrar",
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
                        if (state.password.text !=
                            state.password_confirmation.text) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Kayıt Olunamadı"),
                                  content: Text(
                                      "Parola ve Parola Tekrarı eşleşmiyor"),
                                  actions: [
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
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        child: Text("Tekrar Dene"))
                                  ],
                                );
                              });
                        } else if (state.password.text.length >= 6) {
                          await state.service.updateProfile(
                            name: state.name ?? "",
                            email: state.email ?? "",
                            password: state.password.text,
                            password_confirmation:
                                state.password_confirmation.text,
                          );

                          //////////////////////////////////////////////////////////
                          if (state.service.statuscode == true) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.person, color: Colors.orange),
                                    SizedBox(width: 10),
                                    Text("Profil Güncellendi",
                                        style: GoogleFonts.lato(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.orange[50],
                              ),
                            );
                          } else if (state.service.statuscode == false) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.key, color: Colors.orange),
                                    SizedBox(width: 10),
                                    Text(
                                        "Parola minimun 6 karakter içermelidir",
                                        style: GoogleFonts.lato(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 3),
                                  ],
                                ),
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.orange[50],
                              ),
                            );
                          }
                          state.password.clear();
                          state.password_confirmation.clear();
                        }
                        if (state.service.statuscode == true) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.person, color: Colors.orange),
                                  SizedBox(width: 10),
                                  Text("Profil Güncellendi",
                                      style: GoogleFonts.lato(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 3),
                                ],
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.orange[50],
                            ),
                          );
                        } else if (state.service.statuscode == false) {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(Icons.key, color: Colors.orange),
                                  SizedBox(width: 10),
                                  Text("Parola minimun 6 karakter içermelidir",
                                      style: GoogleFonts.lato(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: 3),
                                ],
                              ),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.orange[50],
                            ),
                          );
                        }
                        state.password.clear();
                        state.password_confirmation.clear();
                      },
                      child: const Text(
                        "Parola Değiştir",
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
