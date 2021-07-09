import 'dart:async';

import 'package:aduaba_app/providers/auth_provider.dart';
import 'package:aduaba_app/providers/category_provider.dart';
import 'package:aduaba_app/providers/product_provider.dart';
import 'package:aduaba_app/providers/user_provider.dart';
import 'package:aduaba_app/screens/home_screen.dart';
import 'package:aduaba_app/screens/onboarding.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/user.dart';

void main() {
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<User> getUserData() => UserPreferences().getUser();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
          ChangeNotifierProvider(create: (_) => CategoryModel()),
          ChangeNotifierProvider(create: (_) => ProductModel())
        ],
        child: MaterialApp(
          theme: ThemeData(
              fontFamily: 'TT Norms Pro',
              scaffoldBackgroundColor: Colors.white),
          debugShowCheckedModeBanner: false,
          home: FutureBuilder(
              future: getUserData(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/landing_image.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                    );
                  case ConnectionState.waiting:
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/landing_image.png',
                            ),
                            fit: BoxFit.cover),
                      ),
                    );
                  default:
                    if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      Timer(
                        const Duration(seconds: 2),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingScreen(),
                          ),
                        ),
                      );
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/landing_image.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                      );
                    } else if (snapshot.data.token == null) {
                      Timer(
                        const Duration(seconds: 2),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnboardingScreen(),
                          ),
                        ),
                      );
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/landing_image.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      Provider.of<UserProvider>(context).setUser(snapshot.data);
                      Timer(
                        const Duration(seconds: 2),
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ),
                        ),
                      );
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/landing_image.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                      );
                    }
                }
              }),
        ));
  }
}
