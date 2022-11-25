import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(
            children: [
              SizedBox(
                height: 80,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://picsum.photos/640/480?random=1")),
              ),
              SizedBox(width: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ürün Adı",
                      style: GoogleFonts.lato(
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    child: Text("Kategori Adı",
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                  ),
                  Text(
                    "€ 99.00",
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.orange,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(width: 17),
              IconButton(onPressed: null, icon: Icon(Icons.remove)),
              Text(
                "1",
                style:
                    GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              IconButton(
                  onPressed: null, icon: Icon(Icons.add, color: Colors.orange)),
            ],
          ),
        ),
      ),
    );
  }
}
