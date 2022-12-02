import 'package:e_commerce_app/screens/auth_profile_screens/check_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => CheckEmailPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 230),
            Icon(
              Icons.shopping_basket,
              color: Colors.orange,
              size: 200,
            ),
            SizedBox(width: 3),
            Text(
              "Nadir",
              style: GoogleFonts.lato(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 60),
            ),
            SizedBox(
              height: 300,
            ),
            Column(
              children: [
                Text("Developed by thedemir"),
                SizedBox(height: 5),
                Text(
                  "V 1.0.0",
                  style: TextStyle(color: Colors.black45),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
