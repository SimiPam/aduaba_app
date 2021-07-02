import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/sign%20in/sign_in.dart';
import 'package:aduaba_app/screens/sign%20up/sign_up.dart';

import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({
    Key key,
    this.title,
    this.subtitle,
    this.image,
  }) : super(key: key);
  final String title, subtitle, image;
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  List<String> title = [
    "Explore Fresh Organic \nProducts Everyday",
    "Eat healthy, Spend Wisely.\nBe happy",
    "Fast Delivery Within 24 \nhours Of Purchase",
  ];

  List<String> subtitle = [
    "Search through a variety of products that help you keep fit and healthy",
    "Discover products by our vendors at very affordable prices",
    "Worried about time? Don’t stress, our products are at our doorstep before sunse",
  ];
  List<String> image = [
    "assets/onboarding1.png",
    "assets/onboarding2.png",
    "assets/onboarding3.png",
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
        scrollDirection: Axis.horizontal,
        controller: controller,
        children: [
          Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.center,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.orange, Colors.red, Colors.wh],
              // ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/onboarding1.png',
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      subtitle.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title[0],
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    subtitle[0],
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                    ),
                    // textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: buttonWidget(
                        buttonText: "Get Started",
                        buttonColor: Color(0xFF3A953C),
                        buttonAction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Have an account already?',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.white70),
                            ),
                            TextSpan(
                              text: (' Sign In '),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.center,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.orange, Colors.red, Colors.white],
              // ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/onboarding2.png',
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: size.height / 1.8),
              child: Padding(
                padding: EdgeInsets.all(22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        subtitle.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      title[1],
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      subtitle[1],
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white70,
                      ),
                      // textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: buttonWidget(
                          buttonText: "Get Started",
                          buttonColor: Color(0xFF3A953C),
                          buttonAction: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignIn(),
                              ),
                            );
                          }),
                    ),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Have an account already?',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white70),
                              ),
                              TextSpan(
                                text: (' Sign In '),
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   begin: Alignment.center,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.orange, Colors.red, Colors.white],
              // ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image[2],
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      subtitle.length,
                      (index) => buildDot(index: index),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title[2],
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    subtitle[2],
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white70,
                    ),
                    // textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: buttonWidget(
                        buttonText: "Get Started",
                        buttonColor: Color(0xFF3A953C),
                        buttonAction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignIn(),
                        ),
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Have an account already?',
                              style: TextStyle(
                                  fontSize: 18, color: Colors.white70),
                            ),
                            TextSpan(
                              text: (' Sign In '),
                              style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 2),
      margin: EdgeInsets.only(right: 9),
      // duration: kAnimationDuration,
      height: 7,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
