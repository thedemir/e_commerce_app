import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/screens/products_screens/category_detail_page.dart';
import 'package:e_commerce_app/state/category/get_category_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../model/get_category_model.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.category,
      required this.id})
      : super(key: key);
  final String imageUrl;
  final String title;
  final int id;
  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetCategoryState>(
      builder: (context, state, child) {
        return GestureDetector(
          onTap: () async {
            await state.fetch(id);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CategoryDetailPage(category: category)));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 70,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(imageUrl)),
                    ),
                    Text(
                      title,
                      style: GoogleFonts.lato(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
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
