import 'package:e_commerce_app/components/category_card.dart';
import 'package:e_commerce_app/components/product_card.dart';
import 'package:e_commerce_app/constants/text_styles.dart';
import 'package:e_commerce_app/model/cart_model.dart';
import 'package:e_commerce_app/screens/products_screens/cart_page.dart';
import 'package:e_commerce_app/screens/products_screens/categories_page.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:e_commerce_app/state/cart/favorite_state.dart';
import 'package:e_commerce_app/state/category/get_category_state.dart';
import 'package:e_commerce_app/state/product/get_all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../state/auth/update_profile_state.dart';
import '../../state/category/get_all_categories_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool click = true;

  @override
  void initState() {
    super.initState();

    Provider.of<GetCategoryState>(context, listen: false).fetch(14);
  }

  Icon favoriteIconDeactive = Icon(
    Icons.favorite_outline_rounded,
    size: 22,
    color: Colors.black45,
  );

  Icon favoriteIconActive = Icon(
    Icons.favorite_rounded,
    size: 22,
    color: Colors.red,
  );

  final snackBar = SnackBar(
    content: Row(
      children: [
        Icon(Icons.shopping_basket_rounded),
        Text("Sepete Eklendi"),
      ],
    ),
    duration: Duration(seconds: 1),
    backgroundColor: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Consumer6<GetAllCategoriesState, UpdateProfileState,
        GetAllProductsState, GetCategoryState, CartState, FavoriteState>(
      builder:
          (context, state, state2, state3, state4, state5, state6, widget) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Kategoriler",
                          textScaleFactor: 1.5, style: TextStyles().v2),
                      TextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoriesPage(),
                            )),
                        child: Text("T??m??n?? G??r??nt??le", textScaleFactor: 0.9),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 120,
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 2),
                    itemCount: state.categories?.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                          id: state.categories?[index].id ?? 14,
                          category: state.categories![index],
                          imageUrl: "${state.categories?[index].image}",
                          title: "${state.categories?[index].title}");
                    },
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("??r??nler",
                          textScaleFactor: 1.5, style: TextStyles().v2),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sort_rounded,
                          color: Colors.orange,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 450,
                    child: GridView.builder(
                      physics: PageScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 186,
                          mainAxisSpacing: 10),
                      itemCount: state3.products?.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          changeFavorite: () {
                            setState(() {
                              click = !click;

                              if (click = false) {
                                state6.addToFavorite(state3.products![index]);
                              } else if (click = true) {
                                state6.removeFromFavorite(
                                    state3.products![index]);
                              }

                              print("sdsfsdf");
                            });
                          },
                          addToCart: () async {
                            state5.incrementCart(state3.products![index]);

                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(Icons.add_shopping_cart_rounded,
                                        color: Colors.orange),
                                    SizedBox(width: 10),
                                    Text("Sepete Eklendi",
                                        style: GoogleFonts.lato(
                                            color: Colors.orange,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 3),
                                    Text("(${state5.cart.length})",
                                        style: GoogleFonts.lato(
                                            color: Colors.black38,
                                            fontSize: 12)),
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
                          },
                          currentIcon: (click = false)
                              ? favoriteIconActive
                              : favoriteIconDeactive,
                          categoryTitle:
                              "${state3.products?[index].category?.title}",
                          imageUrl: "${state3.products?[index].image}",
                          price: "${state3.products?[index].price}",
                          title: "${state3.products?[index].title}",
                          products: state3.products![index],
                        );
                      },
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
//state.categories?[index].image ??
// CartProductModel(
//                             state3.products?[index].id ?? 1,
//                             "${state3.products?[index].title}",
//                             double.parse("${state3.products?[index].price}"),
//                             "${state3.products?[index].image}",
//                             435,
//                             1,
//                           )