import 'dart:developer';
import 'package:e_commerce_app/screens/auth_profile_screens/check_email_page.dart';
import 'package:e_commerce_app/screens/auth_profile_screens/profil_page.dart';
import 'package:e_commerce_app/screens/general_screens/notification_page.dart';
import 'package:e_commerce_app/screens/products_screens/cart_page.dart';
import 'package:e_commerce_app/screens/products_screens/category_detail_page.dart';
import 'package:e_commerce_app/screens/products_screens/favorite_page.dart';
import 'package:e_commerce_app/screens/products_screens/home_page.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:e_commerce_app/state/cart/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../state/auth/update_profile_state.dart';
import '../../state/category/get_all_categories_state.dart';

class PrimaryPage extends StatefulWidget {
  const PrimaryPage({Key? key}) : super(key: key);

  @override
  State<PrimaryPage> createState() => _HomePageState();
}

final tabs = [const HomePage(), const ProfilPage()];
var currentIndex = 0;

class _HomePageState extends State<PrimaryPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Consumer4<LogInState, UpdateProfileState, GetAllCategoriesState,
        CartState>(
      builder: (context, state, state2, state3, state4, child) {
        return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                icon: const Icon(
                  Icons.menu_rounded,
                  color: Colors.white,
                  size: 26,
                ),
              ),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  SizedBox(width: 3),
                  Text(
                    "Nadir",
                    style: GoogleFonts.lato(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              backgroundColor: Colors.orange,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()));
                  },
                  icon: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ],
            ),
            body: tabs[currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) async {
                state2.fetch2;
                setState(() {
                  currentIndex = index;
                });
                log(state2.name ?? "");
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Ana Sayfa"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "Profil"),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // print(state4.cart);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => BasketPage()),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_basket,
                color: Colors.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            drawer: Drawer(
                child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.orange,
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                    child: Column(children: [
                      Stack(
                        children: [
                          Container(
                            height: 95,
                            color: Colors.orange,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20, left: 95),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(state2.name ?? "",
                          style: GoogleFonts.lato(
                              color: Colors.white, fontSize: 29)),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.mail, color: Colors.white, size: 18),
                          Text(
                            state2.email ?? "",
                            style: GoogleFonts.lato(color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10)
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.all(24),
                    child: Wrap(
                      runSpacing: 16,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person_outline),
                          title: const Text("Profil", textScaleFactor: 1.2),
                          onTap: () {
                            Navigator.pop(context);
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.notifications_outlined),
                          title:
                              const Text("Bildirimler", textScaleFactor: 1.2),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NotificationPage(),
                                ));
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.favorite_border_rounded),
                          title: const Text("Favoriler", textScaleFactor: 1.2),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavoritePage(),
                                ));
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.shopping_basket_outlined),
                          title: const Text("Sepet", textScaleFactor: 1.2),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BasketPage()));
                          },
                        ), ////////////////////EXPANS??ON PANEL/////////////
                        // ExpansionPanelList(
                        //   elevation: 0,
                        //   children: [
                        //     ExpansionPanel(
                        //       backgroundColor: Colors.transparent,
                        //       headerBuilder: (context, isExpanded) {
                        //         return ListTile(
                        //           leading: const Icon(Icons.menu_rounded),
                        //           title: const Text("Kategoriler",
                        //               textScaleFactor: 1.2),
                        //           onTap: () {},
                        //         );
                        //       },
                        //       body: Column(
                        //         children: [
                        //           ListTile(
                        //             leading: const Icon(Icons.menu_rounded),
                        //             title: const Text("Kategoriler",
                        //                 textScaleFactor: 1.2),
                        //             onTap: () {},
                        //           ),
                        //           ListTile(
                        //             leading: const Icon(Icons.menu_rounded),
                        //             title: const Text("Kategoriler",
                        //                 textScaleFactor: 1.2),
                        //             onTap: () {},
                        //           ),
                        //         ],
                        //       ),
                        //       canTapOnHeader: true,
                        //       isExpanded: _expanded,
                        //     ),
                        //   ],
                        //   dividerColor: Colors.grey,
                        //   expansionCallback: (panelIndex, isExpanded) {
                        //     _expanded = !_expanded;
                        //     setState(() {});
                        //   },
                        // ),
                        ExpansionTile(
                          leading: const Icon(Icons.menu_rounded),
                          title: Text("Kategoriler", textScaleFactor: 1.2),
                          children: <Widget>[
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: state3.categories?.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: ListTile(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CategoryDetailPage(
                                                          category: state3
                                                                  .categories![
                                                              index])));
                                        },
                                        leading: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                                "${state3.categories?[index].image}"),
                                          ),
                                        ),
                                        title: Text(
                                            "${state3.categories?[index].title}")),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                          title: const Text(
                            "????k???? Yap",
                            textScaleFactor: 1.2,
                            style: TextStyle(color: Colors.red),
                          ),
                          onTap: () async {
                            await state.logOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CheckEmailPage()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
      },
    );
  }
}
