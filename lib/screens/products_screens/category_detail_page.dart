import 'package:e_commerce_app/model/cart_model.dart';
import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:e_commerce_app/state/category/get_category_state.dart';
import 'package:e_commerce_app/state/product/get_all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../components/category_detail_product_card.dart';
import '../../constants/text_styles.dart';
import 'cart_page.dart';

class CategoryDetailPage extends StatelessWidget {
  const CategoryDetailPage({Key? key, required this.category})
      : super(key: key);

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return Consumer2<GetCategoryState, CartState>(
      builder: (context, state, state2, child) {
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
              "Kategori",
              style: GoogleFonts.lato(
                  color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            elevation: 0,
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
                            child: Image.network("${category.image}")),
                        SizedBox(width: 40),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${category.title}",
                                maxLines: 1,
                                style: GoogleFonts.lato(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Padding(
                                padding: const EdgeInsets.only(left: 11),
                                child: Text(
                                    "Ürün Sayısı   ${state.products?.length}",
                                    style: GoogleFonts.lato(
                                        fontSize: 15, color: Colors.grey)),
                              ),
                            ],
                          ),
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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10),
                  itemCount: state.products?.length,
                  itemBuilder: (context, index) {
                    return CategoryDetailProductCard(
                      addToCart: () async {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.add_shopping_cart_rounded,
                                    color: Colors.orange),
                                SizedBox(width: 10),
                                Text("Sepete Eklendi",
                                    style: GoogleFonts.lato(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
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

                        state2.addFirstToCart(state.products![index]);
                      },
                      products: state.products![index],
                      imageUrl: "${state.products?[index].image}",
                      title: "${state.products?[index].title}",
                      price: "${state.products?[index].price}",
                      categoryTitle:
                          "${state.products?[index].category?.title}",
                    );
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
