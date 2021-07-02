import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/widgets/cancel_order.dart';
import 'package:aduaba_app/widgets/order_stepper.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({Key key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 220),
              child: Column(
                children: [
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 150),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF424347),
                        size: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Summary",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color(0xFF819272),
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Divider(height: 20),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                "Your order code is: Z38-9811-K9",
                style: TextStyle(
                    fontSize: 17.5,
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text(
                "Y2 Items: total ( including delivery ) N32,000.00",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff999999),
                    fontWeight: FontWeight.w400),
              ),
            ),
            // OrderStepper(
            //   stepperType: stepperType,
            //   currentStep: _currentStep,
            // ),
            Padding(
              padding: const EdgeInsets.only(top: 270),
              child: SizedBox(
                width: double.infinity,
                child: buttonWidget(
                    buttonAction: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return SingleChildScrollView(
                            child: CancelOrderDialogBox(),
                          );
                        },
                      );
                    },
                    buttonColor: Color(0xFFBB2F48),
                    buttonText: "Cancel Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
