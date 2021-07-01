import 'package:flutter/material.dart';

import '../constants.dart';
import 'cart_screen.dart';
import 'empty_cart_screen.dart';

class HomeTab extends StatelessWidget {
  final VoidCallback openDraw;
  HomeTab({Key key, this.openDraw}) : super(key: key);

  bool _cartEmpty = false;

  List<String> _categoryList = ["Raw Food", "Spices", "Bakery", "Cosmetic"];
  final duplicateItems = List<String>.generate(10, (i) => "Item $i");
  var items = List<String>();

  int _selectedIindex = 0;

  Widget _buildCategoryList(int index) {
    final color = categoryColors[index % categoryColors.length];
    return GestureDetector(
      // onTap: () {
      //   setState(() {
      //     _selectedIindex = index;
      //   });
      // },
      child: Container(
        // height: 60,
        // width: 60,
        width: 92,
        height: 50,
        // padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          // shape: BoxShape.circle,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          _categoryList[index],
          style: TextStyle(
            fontSize: 13,
            color: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (BuildContext context) {
                return GestureDetector(
                  child: Icon(Icons.menu_outlined),
                  onTap: openDraw,
                );
              }),
              Text(
                "Aduaba Fresh",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          _cartEmpty ? EmptyCartScreen() : CartScreen(),
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
        ),
        Padding(
          padding: const EdgeInsets.only(right: 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi Simi",
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xff3A683B),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "What are you looking for today?",
                style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff819272),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 24,
        ),
        buildSearchField('Search Product'),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  '${items[index]}',
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        subTitle(title: "Categories"),
        SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _categoryList
                .asMap()
                .entries
                .map(
                  (MapEntry map) => _buildCategoryList(map.key),
                )
                .toList(),
          ),
        ),
        SizedBox(height: 32),
        subTitle(title: "Today's Promo"),
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 2,
            itemBuilder: (context, i) {
              return Container(
                width: MediaQuery.of(context).size.width - 80,
                // width: 300,
                margin: EdgeInsets.only(top: 16, bottom: 32, right: 10),
                decoration: BoxDecoration(
                    color: Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(8)),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 18, top: 40, right: 180),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Organic Brands",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF3A953C),
                              ),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              "exclusive \nbrands",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF10151A),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Visit our shop for a complete list of our  products",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF999999),
                              ),
                            ),
                            SizedBox(
                              height: 9.5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Shop now",
                                  style: TextStyle(
                                      color: Color(0xFF8AB543),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 10,
                                  color: Color(0xFF8AB543),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 18,
                    //   bottom: 18,
                    //   right: 30,
                    // left: 178,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Image(
                        image: AssetImage("assets/fruitbasket.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        subTitle(title: "Best Selling"),
        Container(
          height: 347,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 16, bottom: 32, right: 16),
                  width: MediaQuery.of(context).size.width / 2 - 32,
                  // color: Colors.red,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        bottom: 10,
                        child: Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 2 - 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.black54,
                          //     offset: Offset(0, 2),
                          //     blurRadius: 6,
                          //   ),
                          // ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            height: MediaQuery.of(context).size.width / 2 - 32,
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
        subTitle(title: "Featured Products", color: Colors.black),
        Container(
          height: MediaQuery.of(context).size.width / 2,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(top: 16, bottom: 32, right: 16),
                  width: MediaQuery.of(context).size.width / 2 - 32,
                  // color: Colors.red,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            width: MediaQuery.of(context).size.width / 2 - 32,
                            height: MediaQuery.of(context).size.width / 2 - 32,
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
    );
  }
}
