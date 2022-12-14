import 'package:e_commerce_app/model/cart_model.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:e_commerce_app/state/cart/favorite_state.dart';
import 'package:e_commerce_app/state/product/get_all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/model/product_model.dart';

import 'cart_page.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({
    Key? key,
    required this.products,
    required this.categoryTitle,
  }) : super(key: key);

  final Data products;
  final String categoryTitle;
  static bool click = true;

  @override
  Widget build(BuildContext context) {
    return Consumer3<GetAllProductsState, CartState, FavoriteState>(
        builder: (context, state, state2, state3, widget) {
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
            "Ürün Detay",
            style: GoogleFonts.lato(
                color: Colors.orange, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Builder(builder: (BuildContext context) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 30, bottom: 20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network("${products.image}")),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.orange[300],
                        borderRadius: BorderRadius.circular(6)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 9),
                      child: Text(
                        "${categoryTitle}",
                        style:
                            GoogleFonts.lato(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        "${products.title}",
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "€ ${products.price}",
                      style: GoogleFonts.lato(
                          fontSize: 25,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text("${products.description}",
                    style: GoogleFonts.lato(fontSize: 20), maxLines: 4),
              ),
              SizedBox(height: 120),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border_rounded,
                        size: 38,
                        color: Colors.grey,
                      )),
                  SizedBox(width: 20),
                  SizedBox(
                    width: 250,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.add_shopping_cart_rounded,
                                    color: Colors.orange),
                                SizedBox(width: 10),
                                Text("Sepete Eklendi",
                                    style: GoogleFonts.lato(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.orange[50],
                            action: SnackBarAction(
                              textColor: Colors.green,
                              label: "Sepete Git",
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BasketPage(),
                                ),
                              ),
                            ),
                          ),
                        );

                        state2.incrementCart(products);
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_basket_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Sepete Ekle",
                            style: GoogleFonts.lato(
                                color: Colors.white, fontSize: 21),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        }),
      );
    });
  }
}
