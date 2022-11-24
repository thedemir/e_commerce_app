import 'package:e_commerce_app/state/category/get_category_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../components/product_card.dart';
import '../../constants/text_styles.dart';
import '../../model/get_category_model.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({Key? key, required this.products})
      : super(key: key);

  final Data products;

  @override
  Widget build(BuildContext context) {
    return Consumer<GetCategoryState>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.white,
                  size: 30,
                )),
          ),
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: 500,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network("${products.image}")),
                        SizedBox(width: 40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${products.title}",
                              style: GoogleFonts.lato(
                                  fontSize: 23, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 11),
                              child: Text("Ürün Sayısı ",
                                  style: GoogleFonts.lato(
                                      fontSize: 15, color: Colors.grey)),
                            ),
                          ],
                        )
                      ]),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ürünler", textScaleFactor: 1.5, style: TextStyles().v2),
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
                height: 602,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return FlutterLogo();
                  },
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
