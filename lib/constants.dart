import 'package:flutter/material.dart';

Widget buildSearchField() {
  final color = Colors.white;

  return TextField(
    style: TextStyle(
      color: Color(0xFFF7F7F7),
    ),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      hintText: 'Search Product',
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
