import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

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
                height: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network("${cartProduct.image}")),
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${cartProduct.title}",
                      style: GoogleFonts.lato(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Text("${cartProduct.title}",
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ),
                  Text(
                    "${cartProduct.productPrice}",
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(width: 17),
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
