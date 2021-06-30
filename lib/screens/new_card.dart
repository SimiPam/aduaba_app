import 'package:aduaba_app/widgets/card_carousel.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class NewCardScreen extends StatefulWidget {
  const NewCardScreen({Key key}) : super(key: key);

  @override
  _NewCardScreenState createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                    "New Card",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFF819272),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  SingleChildScrollView(
                    child: CardCarousel(),
                  ),
                  Text(
                    "Name on card",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  buildTextField('Name on card'),
                  SizedBox(height: 25),
                  Text(
                    "Card Number",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  buildNumberField('Card Number'),
                  SizedBox(height: 25),
                  Text(
                    "Expiry Date",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  buildNumberField('Expiry Date'),
                  SizedBox(height: 25),
                  Text(
                    "CVV",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  buildNumberField('CVV'),
                  SizedBox(height: 30),
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
      ),
    );
  }
}
