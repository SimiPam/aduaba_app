import 'package:flutter/material.dart';

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

Widget buildAddressInputField(
    {String text,
    TextEditingController controller,
    Function(String) onChange,
    Function(String) validate}) {
  return TextFormField(
    autofocus: false,
    cursorColor: Color(0xFF10151A),
    style: TextStyle(
        fontSize: 15, color: Color(0xFF10151A), fontWeight: FontWeight.w700),

    onChanged: onChange,
    validator: validate,
    controller: controller,
    // onChanged: (tit) {
    //   if (tit.isNotEmpty) {
    //     setState(() {
    //       title = tit;
    //     });
    //   }
    // },
    maxLines: null,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 13.5, vertical: 16),
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
