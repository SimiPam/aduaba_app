import 'package:aduaba_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'discover_tab.dart';
import 'home_tab.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
      body: _widget ??
          Container(
            child: Column(
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
                      Row(
                        children: [
                          Text(
                            "18 items listed",
                            style: TextStyle(
                                color: Color(0xFFBBBBBB),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.sort),
                                  Text(
                                    "Sort",
                                    style: TextStyle(
                                        color: Color(0xFFBBBBBB),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  _showModalBottomSheet(context);
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Filter",
                                      style: TextStyle(
                                          color: Color(0xFFBBBBBB),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: 4,
                    staggeredTileBuilder: (index) => StaggeredTile.count(2, 3),
                    mainAxisSpacing: 28.0,
                    crossAxisSpacing: 16.0,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          // height: 70,
                          margin: EdgeInsets.only(top: 0, bottom: 0, right: 0),
                          // width: MediaQuery.of(context).size.width / 2 - 32,
                          // color: Colors.blueAccent,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Positioned(
                                bottom: 10,
                                child: Container(
                                  // height: 120,
                                  width: MediaQuery.of(context).size.width / 2 -
                                      32,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Emmanuel Produce",
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300,
                                            letterSpacing: 1.2,
                                            color: Color(0xFF819272),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          "Herbsconnect Organic Acai Berry Powder Freeze Dried",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "N35,000.00",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: 1.2,
                                                color: Color(0xFFF39E28),
                                              ),
                                            ),
                                            Text(
                                              "・",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFF3A953C),
                                              ),
                                            ),
                                            Text(
                                              "In stock",
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: Color(0xFFF3A953C),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            32,
                                    height:
                                        MediaQuery.of(context).size.width / 2 -
                                            32,
                                    image: AssetImage("assets/fruitbasket.png"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: Image.asset("assets/whiteheart.png"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF3A953C),
        currentIndex: _currentTab,
        onTap: (int val) {
          setState(() {
            _currentTab = val;
            print(val);
            if (val == 2) {
              _scaffoldKey.currentState.openDrawer();
            } else if (val == 1) {
              _widget = DiscoverTab(openDraw: () {
                _scaffoldKey.currentState.openDrawer();
              });
            } else {
              _widget = HomeTab(openDraw: () {
                _scaffoldKey.currentState.openDrawer();
              });
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_outlined),
            label: "",
          ),
        ],
      ),
    );
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          // height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Text(
                "Filter",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF819272),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        );
      },
    );
  }
}
