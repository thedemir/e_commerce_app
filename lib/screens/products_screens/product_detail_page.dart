import 'package:e_commerce_app/state/product/get_all_products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<GetAllProductsState>(builder: (context, state, widget) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.chevron_left_rounded,
                color: Colors.orange,
                size: 30,
              )),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 30, bottom: 20),
              child: Image.network("https://picsum.photos/640/480?random=310"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Fuga veniam.",
                    style: GoogleFonts.lato(fontSize: 38),
                  ),
                  Text(
                    "€ 380",
                    style: GoogleFonts.lato(
                        fontSize: 25,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Text(
                  "Rem vero ut dolores officia ea. Est sint quidem quia. Qui dignissimos non dolorum alias est pariatur totam. Qui dolore consequuntur totam fugit modi.",
                  style: GoogleFonts.lato(fontSize: 20)),
            ),
          ],
        ),
      );
    });
  }
}
