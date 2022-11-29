import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/product_model.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key, required this.cartProduct})
      : super(key: key);

  final CartProductModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              SizedBox(
                height: 75,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("${cartProduct.product.image}")),
              ),
              SizedBox(width: 30),
              Container(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${cartProduct.product.title}",
                        maxLines: 1,
                        style: GoogleFonts.lato(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Text("${cartProduct.product.category?.title}",
                          maxLines: 1,
                          style: GoogleFonts.lato(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey)),
                    ),
                    Text(
                      "${cartProduct.product.price}",
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.orange,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              SizedBox(width: 15),
              IconButton(onPressed: null, icon: Icon(Icons.remove)),
              Text(
                "${cartProduct.piece}",
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: null, icon: Icon(Icons.add, color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
