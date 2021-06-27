import 'package:flutter/material.dart';

Widget buildNumberField(String text) {
  final color = Colors.white;

  return TextField(
    keyboardType: TextInputType.number,
    style: TextStyle(
      color: Color(0xFFF7F7F7),
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: text,
      hintStyle: TextStyle(
          color: Color(0xFFBABABA), fontWeight: FontWeight.w400, fontSize: 15),
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
    ),
  );
}

Widget buildTextField(String text) {
  final color = Colors.white;

  return TextField(
    keyboardType: TextInputType.name,
    style: TextStyle(
      color: Color(0xFFF7F7F7),
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: text,
      hintStyle: TextStyle(
          color: Color(0xFFBABABA), fontWeight: FontWeight.w400, fontSize: 15),
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
    ),
  );
}

Widget buildSearchField(String text) {
  final color = Colors.white;

  return TextField(
    style: TextStyle(
      color: Color(0xFFF7F7F7),
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: text,
      hintStyle: TextStyle(
          color: Color(0xFFBABABA), fontWeight: FontWeight.w400, fontSize: 15),
      prefixIcon: Icon(
        Icons.search_rounded,
        color: Color(0xFFBABABA),
      ),
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
    ),
  );
}

Widget buildRangeField(String text) {
  final color = Colors.white;

  return TextField(
    style: TextStyle(
      color: Color(0xFFF7F7F7),
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: text,
      hintStyle: TextStyle(
          color: Color(0xFFBABABA), fontWeight: FontWeight.w400, fontSize: 15),
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
    ),
  );
}

Row subTitle({String title, Color color}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 17,
          color: Color(0xFF3C673D),
          fontWeight: FontWeight.w700,
        ),
      ),
      Row(
        children: [
          Text(
            "View all  ",
            style: TextStyle(
              fontSize: 13,
              color: color ?? Color(0xFF999999),
              fontWeight: FontWeight.w400,
            ),
          ),
          Image.asset(
            "assets/arrow.png",
            color: color ?? Color(0xFF999999),
          )
        ],
      ),
    ],
  );
}

Widget buildMenuItem({
  @required String text,
  Image image,
  Icon icon,
  VoidCallback onClicked,
}) {
  final color = Color(0xFF10151A);

  return Column(
    children: [
      ListTile(
        leading: image ?? icon,
        title: Text(
          text,
          style: TextStyle(
              fontSize: 17, color: color, fontWeight: FontWeight.w400),
        ),
        onTap: onClicked,
      ),
      Divider(
        color: Color(0xFFF5F5F5),
        // color: Colors.grey,
        thickness: 1,
        height: 0,
      )
    ],
  );
}

Widget buttonWidget(
    {@required VoidCallback buttonAction,
    @required Color buttonColor,
    @required String buttonText}) {
  return Material(
    color: buttonColor,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    elevation: 1,
    child: MaterialButton(
      onPressed: buttonAction,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
      ),
    ),
  );
}

Widget outlineButtonWidget(
    {@required VoidCallback buttonAction,
    @required Color buttonColor,
    @required String buttonText}) {
  return Material(
    color: Colors.transparent,
    // elevation: 1,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFF10151A)),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: MaterialButton(
      onPressed: buttonAction,
      child: Text(
        buttonText,
        style: TextStyle(
            color: Color(0xFF10151A),
            fontSize: 16,
            fontWeight: FontWeight.w700),
      ),
    ),
  );
}

final RegExp emailvalidatorRegExp =
    RegExp(r"^[a-zA-Z0-9,]+@[a-zA-Z0-9,]+\.[a-zA-Z])+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter a valid email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password too short";
const String kMatchPassError = "Passwords don't match";
