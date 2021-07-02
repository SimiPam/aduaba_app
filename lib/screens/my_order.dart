import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/category_screen.dart';
import 'package:aduaba_app/screens/discover_tab.dart';
import 'package:aduaba_app/screens/home_tab.dart';
import 'package:aduaba_app/screens/order_summary.dart';
import 'package:aduaba_app/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({Key key}) : super(key: key);

  @override
  _MyOrdersScreenState createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  List<String> date = [
    " On 22 January, 2020 1:15 pm ",
    " On 22 January, 2020 1:15 pm ",
    " On 22 January, 2020 1:15 pm ",
  ];

  List<String> orderNo = [
    "Order #: 341924186",
    "Order #: 341924186",
    "Order #: 341924186",
  ];
  final status = [
    "Estimated Delivery Due Date on 21 Dec",
    "Cancelled",
    "Delivered 31 Dec"
  ];
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Orders",
                          style: TextStyle(
                              fontSize: 24,
                              color: Color(0xFF819272),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "3 items listed",
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
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderSummary(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: 16, top: 0, left: 24, right: 24),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/image.png",
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      orderNo[index],
                                      style: TextStyle(
                                        color: Color(0xff131313),
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      date[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        // letterSpacing: 1.2,
                                        color: Colors.grey.withOpacity(0.3),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      status[index],
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xfff2902f),
                                      ),
                                    ),
                                  ],
                                ),
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
                  },
                ),
              ),
            ],
          ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
