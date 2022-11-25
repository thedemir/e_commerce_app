import 'package:e_commerce_app/components/cart_product_card.dart';
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
        backgroundColor: Colors.orange[50],
        leading: IconButton(
            icon: Icon(
              Icons.chevron_left_rounded,
              color: Colors.orange,
              size: 30,
            ),
            onPressed: () => Navigator.pop(context)),
        title: Text(
          "Sepet",
          style: GoogleFonts.lato(
              color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 700,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return CartProductCard();
                    },
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border:
                    Border(top: BorderSide(width: 0.6, color: Colors.orange)),
                color: Colors.white,
              ),
              height: 77,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Toplam Tutar",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "€ 0",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                      child: Row(
                        children: [
                          Icon(
                            Icons.payment_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Siparisi Tamamla",
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
