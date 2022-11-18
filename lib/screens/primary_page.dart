import 'package:e_commerce_app/screens/auth&profile_screens/profil_page.dart';
import 'package:e_commerce_app/screens/products_screens/basket_page.dart';
import 'package:e_commerce_app/screens/products_screens/home_page.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:e_commerce_app/state/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/auth/update_profile_state.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  @override
  State<PrimaryPage> createState() => _HomePageState();
}

final tabs = [HomePage(), ProfilPage()];
var currentIndex = 0;

class _HomePageState extends State<PrimaryPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Consumer2<LogInState, UpdateProfileState>(
      builder: (context, state, state2, child) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.orange,
            elevation: 1,
          ),
          body: tabs[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) async {
              await state2.fetch2;
              setState(() {
                currentIndex = index;
              });
              print(state2.name ?? "");
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Ana Sayfa"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profil"),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => BasketPage()),
                ),
              );
            },
            child: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: NavigationDrawer(),
        );
      },
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ));
  }
}

Widget buildHeader(BuildContext context) => Consumer<UpdateProfileState>(
    builder: (context, state, child) => Container(
          color: Colors.orange,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 95,
                  color: Colors.orange,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 95),
                  child: CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(state.name ?? "",
                style: TextStyle(color: Colors.white, fontSize: 29)),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.mail, color: Colors.white, size: 18),
                Text(
                  state.email ?? "",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10)
          ]),
        ));

Widget buildMenuItems(BuildContext context) => Container(
      padding: EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("Profil", textScaleFactor: 1.2),
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => ProfilPage()),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket_outlined),
            title: Text("Sepet", textScaleFactor: 1.2),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.menu_rounded),
            title: Text("Kategoriler", textScaleFactor: 1.2),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              "Çıkış Yap",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
