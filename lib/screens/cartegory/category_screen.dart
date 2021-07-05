import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/model/sort_model.dart';
import 'package:aduaba_app/screens/cart/cart_screen.dart';
import 'package:aduaba_app/screens/cart/empty_cart_screen.dart';

import 'package:aduaba_app/widgets/drawer_widget.dart';
import 'package:aduaba_app/widgets/sort_radio_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math' as math;
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentTab = 0;
  int height = 0;
  Widget _widget;
  bool _cartEmpty = false;

  List<SortOptionsModel> sampleData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//add this variable to the method that checks if the cart is empty
    _cartEmpty = false;

    sampleData.add(SortOptionsModel(
      isSelected: false,
      text: "Popularity",
    ));
    sampleData.add(SortOptionsModel(
      isSelected: false,
      text: "Newest Arrivals",
    ));
    sampleData.add(SortOptionsModel(
      isSelected: false,
      text: "Prices: Lowest to Highest",
    ));
    sampleData.add(SortOptionsModel(
      isSelected: false,
      text: "Prices: Highest to Lowest",
    ));
  }

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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) => _cartEmpty
                                      ? EmptyCartScreen()
                                      : CartScreen(),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundColor: Color(0xFF3A953C),
                              child: Image.asset("assets/homecart.png"),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "18 items listed",
                            style: TextStyle(
                                color: Color(0xFFBBBBBB),
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Container(
                            height: 24,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _showSortModalBottomSheet(context);
                                  },
                                  child: Row(
                                    children: [
                                      Stack(
                                        children: [
                                          Transform.rotate(
                                            angle: 90 * math.pi / 180,
                                            child: Icon(
                                              Icons.arrow_right_alt_sharp,
                                              size: 20,
                                              color: Color(0xFF999999),
                                            ),
                                          ),
                                          Positioned(
                                            left: 4,
                                            child: Transform.rotate(
                                              angle: 270 * math.pi / 180,
                                              child: Icon(
                                                Icons.arrow_right_alt_sharp,
                                                size: 20,
                                                color: Color(0xFF999999),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Sort",
                                        style: TextStyle(
                                            color: Color(0xFF3E3E3E),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 20,
                                        color: Color(0xFFDEDEDE),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                VerticalDivider(
                                  color: Color(0xFFF5F5F5),
                                  // color: Colors.grey,
                                  thickness: 1,
                                  width: 0,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showFilterModalBottomSheet(context);
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.filter_alt_sharp,
                                        size: 18,
                                        color: Color(0xFF999999),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Filter",
                                        style: TextStyle(
                                            color: Color(0xFF3E3E3E),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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
      bottomNavigationBar: bottomNavBar(),
    );
  }

  _showSortModalBottomSheet(context) {
    FontWeight _fontWeight = FontWeight.w400;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return AnimatedContainer(
            height: MediaQuery.of(context).size.height * 0.66,
            duration: Duration(milliseconds: 1000),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sort by",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF819272),
                                  fontWeight: FontWeight.w700),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        SizedBox(
                          height: 34,
                        ),
                        Container(
                            height: MediaQuery.of(context).size.width * 0.5,
                            child: ListView.builder(
                                itemCount: sampleData.length,
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    //highlightColor: Colors.red,
                                    splashColor: Colors.blueAccent,
                                    onTap: () {
                                      setModalState(() {
                                        sampleData.forEach((element) =>
                                            element.isSelected = false);
                                        sampleData[index].isSelected = true;
                                      });
                                    },
                                    child: SortRadioItem(sampleData[index]),
                                  );
                                })),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: buttonWidget(
                          buttonText: "Apply",
                          buttonColor: Color(0xFF3A953C),
                          buttonAction: () {}),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  _showFilterModalBottomSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF819272),
                                  fontWeight: FontWeight.w700),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Vendor",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF10151A),
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        buildSearchField("Search vendor"),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Sub Category",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF10151A),
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width * 0.5,
                          child: StaggeredGridView.countBuilder(
                              crossAxisCount: 8,
                              itemCount: 8,
                              staggeredTileBuilder: (index) =>
                                  StaggeredTile.count(4, 1),
                              mainAxisSpacing: 0.0,
                              crossAxisSpacing: 0.0,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    minLeadingWidth: 6,
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.only(
                                        left: 0, bottom: 0, top: 0),
                                    leading: Checkbox(
                                      // fillColor: Colors.transparent,
                                      // activeColor: Color(0xFF3C673D),
                                      // checkColor: Color(0xFF3C673D),
                                      value: true,
                                      // tristate: false,
                                      onChanged: (value) {},
                                    ),
                                    title: Text("Organic Food"));
                              }),
                        ),
                        Text(
                          "Price Range",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF10151A),
                              fontWeight: FontWeight.w700),
                        ),
                        SfRangeSliderTheme(
                          data: SfRangeSliderThemeData(
                            thumbStrokeWidth: 2,
                            thumbStrokeColor: Color(0xFF3C673D),
                            thumbColor: Color(0xFFFFFFFF),
                            // thumbColor: Colors.transparent,
                            inactiveTrackColor: Color(0xFF3C673D),
                            activeTrackColor: Color(0xFF3C673D),
                            activeTrackHeight: 2,
                            inactiveTrackHeight: 2,
                            thumbRadius: 8,
                          ),
                          child: SfRangeSlider(
                            values: _values,
                            min: 1.0,
                            max: 2000000.0,
                            interval: 1000,
                            onChanged: (SfRangeValues values) {
                              setModalState(
                                () {
                                  _values = values;
                                },
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: buildRangeField("N 0")),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xFF999999)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(child: buildRangeField("N 2000000")),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: buttonWidget(
                          buttonText: "Apply Filter",
                          buttonColor: Color(0xFF3A953C),
                          buttonAction: () {}),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }

  SfRangeValues _values = SfRangeValues(0.0, 2000000.0);
}