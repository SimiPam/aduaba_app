import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/widgets/cancel_order.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatefulWidget {
  OrderSummary({Key key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    Divider(
                      height: 50,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Your order code is: Z38-9811-K9",
                      style: TextStyle(
                          fontSize: 17.5,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Y2 Items: total ( including delivery ) N32,000.00",
                      style: TextStyle(
                          fontSize: 17,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w500),
                    ),
                    Row(),
                    Padding(
                      padding: const EdgeInsets.only(top: 550),
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
            ],
          ),
        ),
      ),
    );
  }
}
