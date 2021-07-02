import 'dart:async';

import 'package:aduaba_app/screens/onboarding/onboarding.dart';

import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
