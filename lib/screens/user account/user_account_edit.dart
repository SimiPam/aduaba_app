import 'dart:io';

import 'package:aduaba_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserAccountEdit extends StatefulWidget {
  UserAccountEdit({Key key}) : super(key: key);

  @override
  _UserAccountEditState createState() => _UserAccountEditState();
}

class _UserAccountEditState extends State<UserAccountEdit> {
  File _image;
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

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
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _showPicker(context);
                    },
                    child: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage("assets/Profile.png"),
                      child: _image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Image.file(
                                _image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 90, bottom: 65),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff979797),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: 30,
                                  height: 30,
                                  child: InkWell(
                                    onTap: () {
                                      _showPicker(context);
                                    },
                                    child: Image.asset(
                                      "assets/Vector.png",
                                      fit: BoxFit.scaleDown,
                                    ),
                                  ),
                                ),
                              ),
                            ),
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

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.photo_library),
                    title: new Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                new ListTile(
                  leading: new Icon(Icons.photo_camera),
                  title: new Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
