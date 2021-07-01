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
      body: Container(
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
                  Text(
                    "Order Summary",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF819272),
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                ),
                child: ListView(
                  children: [
                    Text(
                      "Your order code is: Z38-9811-K9",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "2 Items: total ( including delivery ) N32,000.00",
                      style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff999999),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 32),
                    OrderStepper(
                      title: "Order placed on 26 July",
                      subTitle: "We have received your order",
                      isDone: true,
                    ),
                    OrderStepper(
                      title: "Confirmed",
                      subTitle: "Order accepted on 26 July",
                      isDone: true,
                    ),
                    OrderStepper(
                      title: "Order Shipped",
                      subTitle: "Estimated for 3rd Aug",
                      isDone: false,
                    ),
                    OrderStepper(
                      title: "Delivered",
                      subTitle: "Estimated for 3rd Aug",
                      isDone: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 45),
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
    );
  }
}

class OrderStepper extends StatelessWidget {
  const OrderStepper({this.isDone, this.title, this.subTitle});

  final bool isDone;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          Row(
            children: [
              SizedBox(
                width: 3,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isDone ? Color(0xFFF2902F) : Color(0xFF494846),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: isDone ? Color(0xFFF2902F) : Color(0xFF494846),
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 17,
              ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 15,
                    color: isDone ? Color(0xff10151A) : Color(0xFF999999),
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 6,
              ),
              title == "Delivered"
                  ? Container()
                  : Container(
                      height: 72,
                      child: VerticalDivider(
                        color: Color(0xFFD8D8D8),
                        // color: Colors.grey,
                        thickness: 2,
                        width: 0,
                      ),
                    ),
              SizedBox(
                width: 23,
              ),
              Text(
                subTitle,
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff979797),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
