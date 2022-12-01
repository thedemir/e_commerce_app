import 'package:e_commerce_app/model/cart_model.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../model/product_model.dart';

class CartProductCard extends StatelessWidget {
  CartProductCard(
      {Key? key,
      required this.cartProduct,
      required this.add,
      required this.remove,
      required this.delete,
      required this.piece})
      : super(key: key);

  int piece;
  final CartProductModel cartProduct;
  void Function()? add;
  void Function()? remove;
  final Function(BuildContext context)? delete;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(
      builder: (context, state, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          child: Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                onPressed: delete,
                backgroundColor: Colors.red,
                icon: Icons.delete,
              )
            ]),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                            child: Text(
                                "${cartProduct.product.category?.title}",
                                maxLines: 1,
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey)),
                          ),
                          Text(
                            "€ ${cartProduct.product.price}",
                            style: GoogleFonts.lato(
                                fontSize: 15,
                                color: Colors.orange,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    IconButton(onPressed: remove, icon: Icon(Icons.remove)),
                    Text(
                      "${piece}",
                      style: GoogleFonts.lato(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        onPressed: add,
                        icon: Icon(Icons.add, color: Colors.orange)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
