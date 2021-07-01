import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/screens/sign_in.dart';
import 'package:aduaba_app/screens/sign_up.dart';
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
  String bgImg;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            image[currentPage],
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          PageView.builder(
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: subtitle.length,
            itemBuilder: (context, index) {
              return Container(
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
                        title[index],
                        style: TextStyle(
                          fontSize: 27,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Text(
                        subtitle[index],
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white70,
                        ),
                        // textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 30),
                      Column(
                        children: [
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
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index, bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 2),
      margin: EdgeInsets.only(right: 9),
      // duration: kAnimationDuration,
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
