import 'package:e_commerce_app/components/cart_product_card.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:flutter/material.dart';
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
              Builder(builder: (BuildContext context) {
                return IconButton(
                    onPressed: () {
                      String content;
                      if (state.cartItems.isEmpty) {
                        content = "Sepette Ürün Yok";
                      } else {
                        content = "Sepet Temizlendi";
                      }

                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.only(bottom: 89),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.remove_shopping_cart_rounded,
                                  color: Colors.red),
                              SizedBox(width: 10),
                              Text(content,
                                  style: GoogleFonts.lato(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.orange[50],
                        ),
                      );

                      setState(() {
                        state.cleanCart();
                      });
                    },
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                      size: 30,
                    ));
              })
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
                            delete: (context) {
                              setState(() {
                                state.cancelCartAdd(state.cartItems[index]);

                                state.delleteProduct(state.cartItems[index]);
                              });
                              print(state.cancelCartItems.length);
                              Scaffold.of(context).showSnackBar(
                                SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(bottom: 88),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.add_shopping_cart_rounded,
                                          color: Colors.orange),
                                      SizedBox(width: 10),
                                      Text("Sepetten Çıkartıldı",
                                          style: GoogleFonts.lato(
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  duration: Duration(seconds: 2),
                                  backgroundColor: Colors.orange[50],
                                  action: SnackBarAction(
                                      textColor: Colors.red,
                                      label: "Geri Al",
                                      onPressed: () {
                                        setState(() {
                                          state.incrementCart(
                                              state.cancelCartItems.last);
                                        });
                                      }),
                                ),
                              );
                            },
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
                            totalPrice: (state.cart[state.cartItems[index]])! *
                                double.parse(state.cartItems[index].price!),
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
