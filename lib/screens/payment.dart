import 'package:aduaba_app/screens/new_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                  height: 15,
                ),
                Text(
                  "Payment",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF819272),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 50,
                ),
                //SizedBox(height: 10),
                Text(
                  "My Cards",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 25),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage(
                              "assets/visa.png",
                            ),
                          ),
                        ),
                        Text(
                          "0091•••• •••• 2017",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/trash.png'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Image(
                            image: AssetImage("assets/mastercard.jpeg"),
                          ),
                        ),
                        Text(
                          "0091•••• •••• 2017",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.delete),
                        // ),
                        InkWell(
                          onTap: () {},
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: Image.asset('assets/trash.png'),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 600),
                  child: SizedBox(
                    width: double.infinity,
                    child: buttonWidget(
                        buttonAction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NewCardScreen(),
                            ),
                          );
                          // showModalBottomSheet(
                          //   isScrollControlled: true,
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return Container(
                          //       height: MediaQuery.of(context).size.height /
                          //           100 *
                          //           65,
                          //       decoration: BoxDecoration(color: Colors.white),
                          //       child: Column(
                          //         children: [
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text(
                          //                 "New Card",
                          //                 style: TextStyle(
                          //                   fontSize: 24,
                          //                   color: Colors.black,
                          //                   fontWeight: FontWeight.w700,
                          //                 ),
                          //               ),
                          //               IconButton(
                          //                 onPressed: () {
                          //                   Navigator.pop(context);
                          //                 },
                          //                 icon: Icon(Icons.cancel_sharp),
                          //               )
                          //             ],
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.all(18.0),
                          //             child: Column(
                          //               mainAxisAlignment:
                          //                   MainAxisAlignment.start,
                          //               children: [
                          //                 SizedBox(height: 35),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       right: 300),
                          //                   child: Text(
                          //                     "Name on card",
                          //                     style: TextStyle(
                          //                         fontSize: 15,
                          //                         color: Colors.black,
                          //                         fontWeight: FontWeight.bold),
                          //                   ),
                          //                 ),
                          //                 SizedBox(height: 15),
                          //                 buildTextField('Card Name'),
                          //                 SizedBox(height: 25),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       right: 300),
                          //                   child: Text(
                          //                     "Card Number",
                          //                     style: TextStyle(
                          //                         fontSize: 15,
                          //                         color: Colors.black,
                          //                         fontWeight: FontWeight.bold),
                          //                   ),
                          //                 ),
                          //                 SizedBox(height: 15),
                          //                 buildNumberField('Card Number'),
                          //                 SizedBox(height: 25),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       right: 300),
                          //                   child: Text(
                          //                     "Expiry Date",
                          //                     style: TextStyle(
                          //                         fontSize: 15,
                          //                         color: Colors.black,
                          //                         fontWeight: FontWeight.bold),
                          //                   ),
                          //                 ),
                          //                 SizedBox(height: 15),
                          //                 buildNumberField('Expiry Date'),
                          //                 SizedBox(height: 35),
                          //                 SizedBox(
                          //                   width: double.infinity,
                          //                   child: buttonWidget(
                          //                       buttonAction: () {},
                          //                       buttonColor: Color(0xFF3A953C),
                          //                       buttonText: 'Save '),
                          //                 )
                          //               ],
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                        buttonColor: Color(0xFF3A953C),
                        buttonText: 'Add New Card'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
