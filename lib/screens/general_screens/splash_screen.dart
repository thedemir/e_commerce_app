import 'package:e_commerce_app/screens/auth_profile_screens/check_email_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();

    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CheckEmailPage()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Image(fit: BoxFit.fill, image: AssetImage("assets/logo.png"))));
  }
}
