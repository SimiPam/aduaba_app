import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

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
      imageAdded = true;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      imageAdded = true;
      _image = image;
    });
  }

  bool imageAdded = false;
  removeImage() {
    setState(() {
      imageAdded = false;
      _image = null;
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
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,start
              children: [
                Container(
                  child: Stack(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: _image != null
                              ? FileImage(
                                  _image,
                                )
                              : AssetImage("assets/Profile.png"),
                        ),
                      ),
                      Positioned(
                        top: 0.0,
                        right: 111.0,
                        child: InkWell(
                          onTap: () {
                            _showPicker(context);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                color: Color(0xff979797)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Image.asset(
                                "assets/vector.png",
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),
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
                buildTextField('Phone Number'),
                // SizedBox(height: 65),
                // SizedBox(
                //   width: double.infinity,
                //   child:
                // ),
              ],
            ),
          ))
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 45),
        child: buttonWidget(
            buttonAction: () {},
            buttonColor: Color(0xFF3A953C),
            buttonText: 'Save Changes'),
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
                imageAdded
                    ? new ListTile(
                        leading: new Icon(Icons.cancel),
                        title: new Text('Remove Image'),
                        onTap: () {
                          removeImage();
                          Navigator.of(context).pop();
                        },
                      )
                    : ListTile(),
              ],
            ),
          ),
        );
      },
    );
  }
}
