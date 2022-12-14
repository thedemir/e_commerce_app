import 'package:e_commerce_app/screens/products_screens/category_detail_page.dart';
import 'package:e_commerce_app/screens/products_screens/product_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:e_commerce_app/model/product_model.dart';

class CategoryDetailProductCard extends StatelessWidget {
  CategoryDetailProductCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.price,
      required this.products,
      required this.addToCart,
      required this.categoryTitle})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String price;
  final Data products;
  void Function()? addToCart;
  final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                    products: products,
                    categoryTitle: categoryTitle,
                  ))),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10, left: 22.6, right: 22.6),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image(
                      height: 75,
                      width: 120,
                      fit: BoxFit.fill,
                      image: NetworkImage("$imageUrl")),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.lato(),
              textScaleFactor: 1.2,
              overflow: TextOverflow.visible,
              maxLines: 1,
            ),
            SizedBox(height: 5),
            Text(
              "??? $price",
              style: GoogleFonts.lato(
                  color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 7.7),
            SizedBox(
              width: 120,
              height: 25,
              child: OutlinedButton(
                onPressed: addToCart,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1, color: Colors.orange),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.shopping_basket_rounded,
                      size: 14,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Sepete Ekle",
                      style: GoogleFonts.lato(color: Colors.orange),
                      textScaleFactor: 0.8,
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
