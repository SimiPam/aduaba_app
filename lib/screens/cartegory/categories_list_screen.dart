import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

import 'category_screen.dart';

class CategoriesListingScreen extends StatefulWidget {
  final VoidCallback openDrawer;

  const CategoriesListingScreen({Key key, this.openDrawer}) : super(key: key);
  @override
  _CategoriesListingScreenState createState() =>
      _CategoriesListingScreenState();
}

class _CategoriesListingScreenState extends State<CategoriesListingScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentTab = 0;
  Widget _widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: DrawerWidget(
          openDraw: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      // appBar: AppBar(),
      body: _widget ??
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF424347),
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF819272),
                              fontWeight: FontWeight.w700),
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xFF3A953C),
                          child: Image.asset("assets/homecart.png"),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "23 categories",
                      style: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CategoryScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              bottom: 16, top: 0, left: 24, right: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Hero(
                                        tag: "assets/fruitbasket.png",
                                        child: Container(
                                          width: 60,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/fruitbasket.png",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            "Raw Fruit",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "234 items",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 1.2,
                                              color: Color(0xFFBBBBBB),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image.asset("assets/arrowforward.png"),
                                ],
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Divider(
                                color: Color(0xFFF5F5F5),
                                // color: Colors.grey,
                                thickness: 1,
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}