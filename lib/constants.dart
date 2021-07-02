import 'package:aduaba_app/screens/discover_tab.dart';

import 'package:flutter/material.dart';

Widget pinField(FocusNode fNode, Function(String) onChange) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Color(0xFFF7F7F7),
    ),
    child: SizedBox(
      width: (75.75),
      height: 47,
      child: TextFormField(
        focusNode: fNode,
        obscureText: false,
        keyboardType: TextInputType.number,
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Color(0xFF10151A)),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
        onChanged: onChange,
      ),
    ),
  );
}

Expanded shippingAddress() {
  return Expanded(
    child: ListView.builder(
      itemCount: 2,
      itemBuilder: (_, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16, top: 0, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "David Fayemi",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Railway Quarters , tejuosho, Surulere ,Lagos, \nSurulere (Ojuelegba), Lagos \n+2348074057767",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.2,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 15),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "change",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Image.asset("assets/arrowforward.png"),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline_outlined),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                color: Color(0xFFF5F5F5),
                // color: Colors.grey,
                thickness: 1,
                height: 0,
              ),
            ],
          ),
        );
      },
    ),
  );
}

BottomNavigationBar bottomNavBar() {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentTab = 0;
  Widget _widget;
  return BottomNavigationBar(
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedItemColor: Color(0xFF3A953C),
    currentIndex: _currentTab,
    // onTap: (int val) {
    //   setState(() {
    //     _currentTab = val;
    //     print(val);
    //     if (val == 2) {
    //       _scaffoldKey.currentState.openDrawer();
    //     } else if (val == 1) {
    //       _widget = DiscoverTab(openDraw: () {
    //         _scaffoldKey.currentState.openDrawer();
    //       });
    //     } else {
    //       _widget = HomeTab(openDraw: () {
    //         _scaffoldKey.currentState.openDrawer();
    //       });
    //     }
    //   });
    // },
    items: [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.home_outlined,
          size: 30,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.search,
          size: 30,
        ),
        label: "",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.more_horiz_outlined),
        label: "",
      ),
    ],
  );
}

Expanded billingAddress() {
  return Expanded(
    child: ListView.builder(
      itemCount: 2,
      itemBuilder: (_, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 16, top: 0, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "David Fayemi",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Railway Quarters , tejuosho, Surulere ,Lagos, \nSurulere (Ojuelegba), Lagos \n+2348074057767",
                            style: TextStyle(
                              fontSize: 16,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 15),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "change",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Image.asset("assets/arrowforward.png"),

                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_outline_outlined),
                  ),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Divider(
                color: Color(0xFFF5F5F5),
                // color: Colors.grey,
                thickness: 1,
                height: 0,
              ),
            ],
          ),
        );
      },
    ),
  );
}

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

Widget signUpButtonWidget(
    {@required VoidCallback buttonAction,
    @required Color buttonColor,
    String img,
    @required String buttonText}) {
  return Material(
    color: buttonColor,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    elevation: 1,
    child: MaterialButton(
      onPressed: buttonAction,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img),
          SizedBox(
            width: 13.5,
          ),
          Text(
            buttonText,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}

Widget signUpOutlineButtonWidget(
    {@required VoidCallback buttonAction,
    String img,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(img),
          SizedBox(
            width: 13.5,
          ),
          Text(
            buttonText,
            style: TextStyle(
                color: Color(0xFF10151A),
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    ),
  );
}

Widget outlineButtonWidget(
    {@required VoidCallback buttonAction,
    // @required Color buttonColor,
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

Padding buildAddressSubTitle(String text, VoidCallback onPress) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Color(0xFF10151A)),
        ),
        TextButton.icon(
            onPressed: onPress,
            icon: Icon(
              Icons.add,
              color: Color(0xFF3E3E3E),
              size: 18,
            ),
            label: Text(
              "Add Address",
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: Color(0xFF3E3E3E)),
            ))
      ],
    ),
  );
}

List<Color> categoryColors = [
  // Color(0xFF3A953C1A),
  Color(0xFF3A953C),
  Color(0xFFBB2F48),
  Color(0xFF3C673D),
  Color(0xFFE75A21),
];

TextFormField buildTextFormField(
    {Function(String) validate,
    Function(String) onSave,
    Function(String) onChange,
    @required bool pass,
    TextInputType textInputType,
    String text}) {
  return TextFormField(
    obscureText: pass,
    onSaved: onSave,
    onChanged: onChange,
    validator: validate,
    keyboardType: textInputType ?? TextInputType.name,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      fillColor: Color(0xfff7f7f7),
      filled: true,
      hintText: text,
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xffbababa),
      ),
    ),
  );
}

TextFormField buildPasswordTextFormField(
    {Function(String) validate,
    Function(String) onSave,
    Function(String) onChange,
    VoidCallback togglePasswordView,
    @required bool pass,
    TextInputType textInputType,
    String text}) {
  return TextFormField(
    obscureText: pass,
    onSaved: onSave,
    onChanged: onChange,
    validator: validate,
    keyboardType: textInputType ?? TextInputType.name,
    decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      fillColor: Color(0xfff7f7f7),
      filled: true,
      hintText: text,
      suffixIcon: InkWell(
        onTap: togglePasswordView,
        child: Icon(
          pass ? Icons.visibility : Icons.visibility_off_outlined,
          color: Color(0xff999999),
        ),
      ),
      hintStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xffbababa),
      ),
    ),
  );
}

Text formTextTitle(text) {
  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      color: Color(0xFF10151A),
      fontWeight: FontWeight.w700,
    ),
  );
}
