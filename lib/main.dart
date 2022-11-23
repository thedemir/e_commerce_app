import 'package:e_commerce_app/screens/auth_profile_screens/check_email_page.dart';
import 'package:e_commerce_app/state/auth/check_email_state.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:e_commerce_app/state/auth/register_state.dart';
import 'package:e_commerce_app/state/auth/update_profile_state.dart';
import 'package:e_commerce_app/state/category/get_all_categories_state.dart';
import 'package:e_commerce_app/state/product/get_all_products_state.dart';
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
            create: (context) => CheckEmailState()),
        ChangeNotifierProvider<RegisterState>(
            create: (context) => RegisterState()),
        ChangeNotifierProvider<UpdateProfileState>(
            create: (context) => UpdateProfileState()),
        ChangeNotifierProvider<GetAllCategoriesState>(
            create: (context) => GetAllCategoriesState()),
        ChangeNotifierProvider<GetAllProductsState>(
            create: (context) => GetAllProductsState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.orange,
            appBarTheme: AppBarTheme(elevation: 0)),
        home: const CheckEmailPage(),
      ),
    );
  }
}
