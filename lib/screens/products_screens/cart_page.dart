import 'package:e_commerce_app/components/cart_product_card.dart';
import 'package:e_commerce_app/screens/general_screens/primary_page.dart';
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
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      state.cleanCart();
                    });
                  },
                  icon: Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                    size: 30,
                  ))
            ],
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
                            delete: () {},
                            remove: () {
                              setState(() {
                                state.increseProduct(state.cartItems[index]);
                              });
                            },
                            add: () {
                              setState(() {
                                state.incrementCart(state.cartItems[index]);
                              });
                            },
                            cartProduct: state.cartItems[index],
                            piece: state.cart[state.cartItems[index]] ?? 1,
                          );
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Toplam Tutar",
                              style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black38),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "€${state.cartTotalMoney}",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              "${state.cartItems.length} Ürün",
                              style: GoogleFonts.lato(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange[300]),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13, horizontal: 12),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.payment_rounded,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Sepeti Onayla",
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
