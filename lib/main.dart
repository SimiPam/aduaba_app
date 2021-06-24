import 'package:aduaba_app/model/drawer_data.dart';
import 'package:aduaba_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'TT Norms Pro', scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
