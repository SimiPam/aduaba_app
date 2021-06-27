import 'package:aduaba_app/widgets/dialog_box.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    super.dispose();
  }

  void nextField({String value, FocusNode focusNode}) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  bool remember = false;
  int _radioVal = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Forgot Password \nto your account",
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    //  textAlign: TextAlign.center,
                  ),
                  CircleAvatar(
                    backgroundColor: Color(0xffecf5ec),
                    child: Icon(
                      Icons.security,
                      size: 27,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(right: 120),
                child: Text(
                  "Select what contact details we use \nto reset your password",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.phone_android_outlined,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "via sms:",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "••• •••• 7767",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Radio(
                    value: 0,
                    groupValue: this._radioVal,
                    onChanged: (int value) {
                      setState(() => this._radioVal = value);
                    },
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "via email:",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "••• ••••vid@gmail.com",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Radio(
                    value: 0,
                    groupValue: this._radioVal,
                    onChanged: (int value) {
                      setState(() => this._radioVal = value);
                    },
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: buttonWidget(
                  buttonText: "Continue",
                  buttonColor: Color(0xFF3A953C),
                  buttonAction: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height / 100 * 60,
                          child: otpForm(context),
                        );
                      },
                    );
                  },
                ),
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Column otpForm(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Enter 4 Digits Code",
              style: TextStyle(
                fontSize: 23,
                color: Color(0xFF3A953C),
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel),
            ),
          ],
        ),
        Text(
          "Enter the four digits code sent to your email \naddress",
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(28.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                ),
                child: SizedBox(
                  width: (50),
                  child: TextFormField(
                    autofocus: true,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin2FocusNode);
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                ),
                child: SizedBox(
                  width: (50),
                  child: TextFormField(
                    focusNode: pin2FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin3FocusNode);
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                ),
                child: SizedBox(
                  width: (50),
                  child: TextFormField(
                    focusNode: pin3FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin4FocusNode);
                    },
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                ),
                child: SizedBox(
                  width: (50),
                  child: TextFormField(
                    focusNode: pin4FocusNode,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) {
                      nextField(value: value, focusNode: pin5FocusNode);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(38.0),
          child: SizedBox(
            width: double.infinity,
            child: buttonWidget(
                buttonText: "Continue",
                buttonColor: Color(0xFF3A953C),
                buttonAction: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height / 100 * 60,
                        child: newPasswordModal(),
                      );
                    },
                  );
                }),
          ),
        ),
      ],
    );
  }

  Column newPasswordModal() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Reset Password",
              style: TextStyle(
                fontSize: 23,
                color: Color(0xFF3A953C),
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 80),
          child: Text(
            "Set the new password for your account \nso you can login and access the features",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 250),
                      child: Text(
                        "New Password",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    buildTextField('New Password'),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(right: 230),
                      child: Text(
                        "Confirm Password",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 10),
                    buildTextField('Confirm Password'),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: SizedBox(
                        width: double.infinity,
                        child: buttonWidget(
                          buttonAction: () {
                            showDialog(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                child: DialogBox(),
                              ),
                            );
                          },
                          buttonColor: Color(0xFF3A953C),
                          buttonText: 'Save password',
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
