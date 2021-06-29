import 'package:flutter/material.dart';

import '../constants.dart';

class UserAccountEdit extends StatefulWidget {
  UserAccountEdit({Key key}) : super(key: key);

  @override
  _UserAccountEditState createState() => _UserAccountEditState();
}

class _UserAccountEditState extends State<UserAccountEdit> {
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
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF819272),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 120),
                  child: SizedBox(
                    height: 115,
                    width: 115,
                    child: Stack(
                      overflow: Overflow.visible,
                      fit: StackFit.expand,
                      children: [
                        CircleAvatar(
                          //  backgroundColor: Colors.red,
                          backgroundImage: AssetImage("assets/person.png"),
                        ),
                        Positioned(
                          bottom: 70,
                          right: -7,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: FlatButton(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35),
                                side: BorderSide(color: Colors.grey),
                              ),
                              color: Colors.white,
                              onPressed: () {},
                              child: Icon(Icons.camera),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                Text(
                  "First Name",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                buildTextField('First Name'),
                SizedBox(height: 25),
                Text(
                  "Last Name",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                buildTextField('Last Name'),
                SizedBox(height: 25),
                Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                buildNumberField('Phone Number'),
                SizedBox(height: 65),
                SizedBox(
                  width: double.infinity,
                  child: buttonWidget(
                      buttonAction: () {},
                      buttonColor: Color(0xFF3A953C),
                      buttonText: 'Save Changes'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
