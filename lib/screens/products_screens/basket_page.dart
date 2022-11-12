import 'package:e_commerce_app/screens/primary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.orange,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => PrimaryPage()),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Sepetim",
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
    );
  }
}
