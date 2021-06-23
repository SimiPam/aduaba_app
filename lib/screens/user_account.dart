import 'package:flutter/material.dart';

import '../constants.dart';

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
            child: Column(children: [
              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/cart.png"),
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
              Container(
                padding: EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 28,
                    ),
                    buildMenuItem(
                        image: Image.asset(
                          "assets/wishlist.png",
                          color: Color(0xFFBB2F48),
                        ),
                        text: "My Wishlist"),
                    buildMenuItem(
                        image: Image.asset(
                          "assets/cart.png",
                          color: Color(0xFFE75A21),
                        ),
                        text: "My Orders"),
                    buildMenuItem(
                        image: Image.asset(
                          "assets/payment.png",
                          color: Color(0xFF3A953C),
                        ),
                        text: "Payment"),
                    buildMenuItem(
                        image: Image.asset(
                          "assets/delivery.png",
                          color: Color(0xFFF39E28),
                        ),
                        text: "Shipping details"),
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
        buttonWidget(
            buttonText: "Log Out",
            buttonColor: Color(0xFFBB2F48),
            buttonAction: () {}),
      ]),
    );
  }
}
