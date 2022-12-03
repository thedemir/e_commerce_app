import 'package:e_commerce_app/components/favorite_product_card.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:e_commerce_app/state/cart/favorite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<FavoriteState, CartState>(
      builder: (context, state, stateCart, child) {
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
              "Favoriler",
              style: GoogleFonts.lato(
                  color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                itemCount: state.favoriteList.length,
                itemBuilder: (context, index) {
                  return FavoriteProductCard(
                      imageUrl: "${state.favoriteList[index].image}",
                      title: "${state.favoriteList[index].title}",
                      price: "${state.favoriteList[index].price}",
                      categoryTitle:
                          "${state.favoriteList[index].category?.title}",
                      products: state.favoriteList[index],
                      addToCart: () {},
                      removeFromFavorite: () {
                        state.removeFromFavorite(state.favoriteList[index]);
                      });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
