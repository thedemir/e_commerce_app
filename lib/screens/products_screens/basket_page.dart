import 'package:e_commerce_app/screens/primary_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Sepet",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.5,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Container(
                width: 65,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(14)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attach_money_rounded, color: Colors.orange),
                    Text(
                      "0",
                      textScaleFactor: 1.5,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.orange),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
