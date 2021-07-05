import 'package:aduaba_app/screens/my_order.dart';
import 'package:aduaba_app/screens/payment.dart';
import 'package:aduaba_app/screens/payment_tab.dart';
import 'package:aduaba_app/screens/shipping_details.dart';
import 'package:aduaba_app/screens/shipping_tab.dart';
import 'package:aduaba_app/screens/user_account_edit.dart';
import 'package:aduaba_app/screens/wishlist.dart';
import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class UserAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                "Account",
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF819272),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(right: 24),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/Profile.png"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Andrea Charles",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "AndreaCharles@gmail.com",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF999999),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "0908765432",
                            style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF999999),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                UserAccountEdit(),
                          ),
                        );
                      },
                      child: Image.asset("assets/edit.png")),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 28,
                    ),
                    buildMenuItem(
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WishlistScreen(),
                            ),
                          );
                        },
                        image: Image.asset(
                          "assets/wishlist.png",
                          color: Color(0xFFBB2F48),
                        ),
                        text: "My Wishlist"),
                    buildMenuItem(
                        onClicked: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MyOrdersScreen(),
                            ),
                          );
                        },
                        image: Image.asset(
                          "assets/cart.png",
                          color: Color(0xFFE75A21),
                        ),
                        text: "My Orders"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => PaymentScreen(),
                          ),
                        );
                      },
                      child: buildMenuItem(
                          image: Image.asset(
                            "assets/payment.png",
                            color: Color(0xFF3A953C),
                          ),
                          text: "Payment"),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ShippingAddressTab(),
                          ),
                        );
                      },
                      child: buildMenuItem(
                          image: Image.asset(
                            "assets/delivery.png",
                            color: Color(0xFFF39E28),
                          ),
                          text: "Shipping details"),
                    ),
                    buildMenuItem(
                      icon: Icon(
                        Icons.settings,
                        color: Color(0xFFF819272),
                      ),
                      text: "Settings",
                      onClicked: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             EditUserAccount()));
                      },
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 45),
          child: buttonWidget(
              buttonText: "Log Out",
              buttonColor: Color(0xFFBB2F48),
              buttonAction: () {}),
        ),
      ]),
    );
  }
}
