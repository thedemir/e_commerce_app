import 'package:e_commerce_app/screens/products_screens/product_detail_page.dart';
import 'package:e_commerce_app/state/cart/favorite_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  ProductCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.categoryTitle,
      required this.products,
      required this.addToCart,
      required this.changeFavorite,
      required this.currentIcon})
      : super(key: key);

  final Icon currentIcon;
  final String imageUrl;
  final String title;
  final String price;
  final String categoryTitle;
  final Data products;
  void Function()? addToCart;
  void Function()? changeFavorite;

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteState>(
      builder: (context, state, child) {
        return GestureDetector(
          onTap: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return Center(
                    child: CircularProgressIndicator(color: Colors.orange),
                  );
                });
            Navigator.of(context).pop();
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                          products: products,
                          categoryTitle: "${products.category?.title}",
                        )));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10, left: 22.6, right: 22.6),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                height: 80,
                                width: 130,
                                fit: BoxFit.fill,
                                image: NetworkImage("$imageUrl"),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          categoryTitle,
                          style: GoogleFonts.lato(
                              color: Colors.black26, fontSize: 11),
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                        ),
                        Text(
                          title,
                          style: GoogleFonts.lato(),
                          textScaleFactor: 1.2,
                          overflow: TextOverflow.visible,
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "€ $price",
                          style: GoogleFonts.lato(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_outline_rounded,
                        size: 22,
                        color: Colors.black45,
                      ),
                      SizedBox(width: 7),
                      SizedBox(
                        width: 120,
                        height: 22,
                        child: OutlinedButton(
                          onPressed: addToCart,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(width: 1, color: Colors.orange),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_basket_rounded,
                                size: 14,
                                color: Colors.orange,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Sepete Ekle",
                                style: GoogleFonts.lato(color: Colors.orange),
                                textScaleFactor: 0.8,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
