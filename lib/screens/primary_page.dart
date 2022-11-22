import 'dart:developer';
import 'package:e_commerce_app/screens/auth_profile_screens/check_email_page.dart';
import 'package:e_commerce_app/screens/auth_profile_screens/profil_page.dart';
import 'package:e_commerce_app/screens/products_screens/basket_page.dart';
import 'package:e_commerce_app/screens/products_screens/home_page.dart';
import 'package:e_commerce_app/state/auth/log_in_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../state/auth/update_profile_state.dart';

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
    return Consumer2<LogInState, UpdateProfileState>(
      builder: (context, state, state2, child) {
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
                ),
              ),
              backgroundColor: Colors.orange,
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
                          style: TextStyle(color: Colors.white, fontSize: 29)),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.mail, color: Colors.white, size: 18),
                          Text(
                            state2.email ?? "",
                            style: const TextStyle(color: Colors.white),
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
                          leading: const Icon(Icons.shopping_basket_outlined),
                          title: const Text("Sepet", textScaleFactor: 1.2),
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BasketPage()));
                          },
                        ), ////////////////////EXPANSİON PANEL/////////////
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
                          children: <Widget>[],
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.exit_to_app,
                            color: Colors.red,
                          ),
                          title: const Text(
                            "Çıkış Yap",
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
