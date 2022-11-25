import 'package:e_commerce_app/components/category_card.dart';
import 'package:e_commerce_app/state/category/get_all_categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../constants/text_styles.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllCategoriesState>(
      builder: (context, state, child) {
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
                "Kategoriler",
                style: GoogleFonts.lato(
                    color: Colors.orange, fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Kategoriler",
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      height: 900,
                      child: GridView.builder(
                        physics: PageScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 10),
                        itemCount: state.categories?.length,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                              id: 14,
                              category: state.categories![index],
                              imageUrl: "${state.categories?[index].image}",
                              title: "${state.categories?[index].title}");
                        },
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
