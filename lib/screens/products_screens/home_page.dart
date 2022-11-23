import 'package:e_commerce_app/components/category_card.dart';
import 'package:e_commerce_app/components/product_card.dart';
import 'package:e_commerce_app/constants/text_styles.dart';
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
  Widget build(BuildContext context) {
    return Consumer3<GetAllCategoriesState, UpdateProfileState,
        GetAllProductsState>(builder: (context, state, state2, state3, widget) {
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
                        onPressed: () {},
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
                        onPressed: () {
                          state3.fetch();
                        },
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
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 10),
                    itemCount: state.categories?.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        categoryTitle:
                            "${state3.products?[index].category?.title}",
                        imageUrl: "${state3.products?[index].image}",
                        price: "${state3.products?[index].price}",
                        title: "${state3.products?[index].title}",
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