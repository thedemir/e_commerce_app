import 'package:e_commerce_app/screens/auth&profile_screens/profil_page.dart';
import 'package:e_commerce_app/screens/auth&profile_screens/register_page.dart';
import 'package:e_commerce_app/screens/products_screens/basket_page.dart';
import 'package:e_commerce_app/screens/products_screens/home_page.dart';
import 'package:flutter/material.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  @override
  State<PrimaryPage> createState() => _HomePageState();
}

final tabs = [HomePage(), ProfilPage()];
var currentIndex = 0;

class _HomePageState extends State<PrimaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Ana Sayfa"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => BasketPage()),
          ),
        ),
        child: Icon(
          Icons.shopping_basket,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
