import 'package:e_commerce_app/components/category_card.dart';
import 'package:e_commerce_app/components/product_card.dart';
import 'package:e_commerce_app/constants/text_styles.dart';
import 'package:e_commerce_app/model/cart_model.dart';
import 'package:e_commerce_app/screens/products_screens/categories_page.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:e_commerce_app/state/category/get_category_state.dart';
import 'package:e_commerce_app/state/product/get_all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../state/auth/update_profile_state.dart';
import '../../state/category/get_all_categories_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<GetCategoryState>(context, listen: false).fetch(14);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer5<GetAllCategoriesState, UpdateProfileState,
            GetAllProductsState, GetCategoryState, CartState>(
        builder: (context, state, state2, state3, state4, state5, widget) {
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
                        child: Text("Tümünü Görüntüle", textScaleFactor: 0.9))
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
                        id: 14,
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
                    Text("Ürünler",
                        textScaleFactor: 1.5, style: TextStyles().v2),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sort_rounded,
                          color: Colors.orange,
                        ))
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
                        mainAxisSpacing: 10),
                    itemCount: state3.products?.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        addToCart: () {
                          state5.addFirstToCart(
                              CartProductModel(state3.products![index]));
                        },
                        categoryTitle:
                            "${state3.products?[index].category?.title}",
                        imageUrl: "${state3.products?[index].image}",
                        price: "${state3.products?[index].price}",
                        title: "${state3.products?[index].title}",
                        products: state4.products![index],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
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