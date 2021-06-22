import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/cart.png"),
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                "Andrea Charles",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              SizedBox(
                height: 28,
              ),
              buildMenuItem(
                  image: Image.asset("assets/cart.png"), text: "Cart"),
              buildMenuItem(
                  image: Image.asset("assets/category.png"),
                  text: "Categories"),
              buildMenuItem(
                  image: Image.asset("assets/wishlist.png"),
                  text: "My Wishlist"),
              buildMenuItem(
                  image: Image.asset("assets/cart.png"), text: "Orders"),
              buildMenuItem(
                  image: Image.asset("assets/person.png"),
                  text: "Account Details"),
            ],
          ),
        ),
        Container(
          color: Color(0xFFF9F9F9),
          // height: 48,
          margin: EdgeInsets.only(left: 35, top: 20),
          padding: EdgeInsets.only(bottom: 16, top: 14),
          alignment: Alignment.centerLeft,
          child: Text(
            "Support",
            style: TextStyle(
                fontSize: 15,
                color: Color(0xFF979797),
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            children: [
              buildMenuItem(text: "Contact Us"),
              buildMenuItem(text: "Help & FAQs"),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.asset("assets/drawerlogo.png"),
              SizedBox(
                height: 36,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF999999),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "・",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF999999),
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Terms of Use",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF999999),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildMenuItem({
    @required String text,
    Image image,
    VoidCallback onClicked,
  }) {
    final color = Color(0xFF10151A);

    return ListTile(
      leading: image,
      title: Text(
        text,
        style:
            TextStyle(fontSize: 17, color: color, fontWeight: FontWeight.w400),
      ),
      onTap: onClicked,
    );
  }
}
