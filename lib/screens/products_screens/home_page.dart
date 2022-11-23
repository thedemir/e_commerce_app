import 'package:e_commerce_app/components/category_card.dart';
import 'package:e_commerce_app/components/product_card.dart';
import 'package:e_commerce_app/constants/text_styles.dart';
import 'package:e_commerce_app/state/categories/all_categories_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../state/auth/update_profile_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<GetAllCategoriesState, UpdateProfileState>(
        builder: (context, state, state2, widget) {
      return Scaffold(
        body: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Kategoriler",
                  textScaleFactor: 1.5, style: TextStyles().v2),
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
              padding: const EdgeInsets.only(right: 278),
              child:
                  Text("Ürünler", textScaleFactor: 1.5, style: TextStyles().v2),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 1,
                    crossAxisSpacing: 120,
                    mainAxisSpacing: 30,
                  ),
                  itemCount: state.categories?.length,
                  itemBuilder: (context, index) {
                    return ProductCard();
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
//state.categories?[index].image ??