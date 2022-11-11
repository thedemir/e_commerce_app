import 'package:e_commerce_app/screens/check_email_page.dart';
import 'package:e_commerce_app/screens/log_in_page.dart';
import 'package:e_commerce_app/state/check_email_state.dart';
import 'package:e_commerce_app/state/log_in_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LogInState>(create: (context) => LogInState()),
        ChangeNotifierProvider<CheckEmailState>(
            create: (context) => CheckEmailState())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const CheckEmailPage(),
      ),
    );
  }
}
