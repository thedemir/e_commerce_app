import 'package:e_commerce_app/components/cart_product_card.dart';
import 'package:e_commerce_app/screens/primary_page.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (context, state, child) {
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
                      height: 687,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: state.cart.length,
                        itemBuilder: (context, index) {
                          return CartProductCard(
                              remove: () {
                                setState(() {
                                  state.cart[index].piece -= 1;
                                });
                              },
                              add: () {
                                setState(() {
                                  state.cart[index].piece += 1;
                                });
                              },
                              cartProduct: state.cart[index]);
                        },
                      ),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(width: 0.6, color: Colors.orange)),
                    color: Colors.white,
                  ),
                  height: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Toplam Tutar",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "€${state.calculateTotal()}",
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 9, horizontal: 3),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.payment_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Devam et",
                                  style: GoogleFonts.lato(
                                      color: Colors.white, fontSize: 15),
                                )
                              ],
                            ),
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
      },
    );
  }
}
