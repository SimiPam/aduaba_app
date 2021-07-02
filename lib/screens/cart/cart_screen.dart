import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/checkout/checkout_screen.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _n = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                Text(
                  "Cart",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF819272),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "18 items selected",
                      style: TextStyle(
                          color: Color(0xFFBBBBBB),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check,
                              size: 20,
                              color: Color(0xFF999999),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Select All",
                              style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.delete,
                              size: 18,
                              color: Color(0xFF999999),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Delete Selected",
                              style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ListTile(
                          //   leading:
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            activeColor: Color(0xFFE75A21),
                            checkColor: Color(0xFFFFFFFF),
                            // value: _item.isSelected ? true : false,
                            value: true,
                            tristate: false,
                            onChanged: (value) {},
                          ),
                          // title:
                          Container(
                            margin: EdgeInsets.only(bottom: 16, top: 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 140,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 250,
                                        child: Text(
                                          "Herbsconnect Organic Acai Berry Powder Freeze Dried",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Emmanuel Produce",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: 1.2,
                                          color: Color(0xFFBBBBBB),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
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
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFF3A953C),
                                            ),
                                          ),
                                          Text(
                                            "In stock",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xFFF3A953C),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _n--;
                                              });
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              color: Color(0xFFF3F3F3),

                                              // padding: EdgeInsets.all(8),
                                              child: Center(
                                                  child: Icon(
                                                Icons.remove,
                                                size: 16,
                                                color: Color(0xFF979797),
                                              )),
                                            ),
                                          ),
                                          Container(
                                            height: 32,
                                            width: 32,
                                            color: Color(0xFFF3F3F3),
                                            padding: EdgeInsets.all(8),
                                            child: Center(
                                              child: Text('$_n',
                                                  style: TextStyle(
                                                      fontSize: 14.0)),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                _n++;
                                              });
                                            },
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              color: Color(0xFFF3F3F3),
                                              // padding: EdgeInsets.all(8),
                                              child: Center(
                                                  child: Icon(
                                                Icons.add,
                                                size: 16,
                                                color: Color(0xFF979797),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 32,
                                              width: 32,
                                              color: Color(0xFFF3F3F3),
                                              // padding: EdgeInsets.all(8),
                                              child: Center(
                                                  child: Icon(
                                                Icons.delete,
                                                size: 20,
                                                color: Color(0xFF979797),
                                              )),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/fruitbasket.png",
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color(0xFFF5F5F5),
                        // color: Colors.grey,
                        thickness: 1,
                        height: 0,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 33, horizontal: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total 2 Items",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "N35,000.00",
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 16),
                  child: buttonWidget(
                    buttonText: "Proceed to Checkout",
                    buttonColor: Color(0xFF3A953C),
                    buttonAction: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                CheckoutScreen()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24.0, right: 24.0, bottom: 45),
                  child: outlineButtonWidget(
                      buttonText: "Continue Shopping",
                      // buttonColor: Color(0xFF3A953C),
                      buttonAction: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
