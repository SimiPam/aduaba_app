import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/sign_in.dart';
import 'package:aduaba_app/screens/sign_up.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: PageView(
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
                  Text(
                    "Explore Fresh Organic \nProducts Everyday",
                    style: TextStyle(
                      fontSize: 27,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Search through a variety of products that help you keep fit and healthy",
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
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: (' Sign In '),
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
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
                    Text(
                      "Eat healthy, Spend Wisely.\nBe happy",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Discover products by our vendors at very affordable prices",
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
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: (' Sign In '),
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
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
                  'assets/onboarding3.png',
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(22.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    "Fast Delivery Within 24 \nhours Of Purchase",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Worried about time? Don't stress, our products are at our doorstep before sunset",
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
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: (' Sign In '),
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
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
}
