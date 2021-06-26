import 'package:aduaba_app/constants/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Colors.green;
const kPrimaryLightColor = Colors.blue;
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [(Colors.black), (Colors.pink)],
);
const kSecondaryColor = Colors.red;
const kTextPrimaryColor = Colors.black;
const kTextColor = Colors.grey;

const kAnimationDuration = Duration(milliseconds: 200);

//form error
final RegExp emailvalidatorRegExp =
    RegExp(r"^[a-zA-Z0-9,]+@[a-zA-Z0-9,]+\.[a-zA-Z])+");
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Please enter a valid email";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Password too short";
const String kMatchPassError = "Passwords don't match";

final otpInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getProportionateScreenWidth(30),
  ),
  enabledBorder: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  border: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Colors.black),
  );
}
