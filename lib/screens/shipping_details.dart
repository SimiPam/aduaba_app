import 'package:aduaba_app/constants.dart';
import 'package:flutter/material.dart';

class ShippingDetailsScreen extends StatefulWidget {
  const ShippingDetailsScreen({Key key}) : super(key: key);

  @override
  _ShippingDetailsScreenState createState() => _ShippingDetailsScreenState();
}

class _ShippingDetailsScreenState extends State<ShippingDetailsScreen> {
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
                  height: 22,
                ),
                Text(
                  "Shipping Details",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF819272),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shipping address",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 20,
                        ),
                        TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height /
                                      100 *
                                      50,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "New Address",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: Icon(Icons.cancel_sharp),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(18.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 270),
                                                      child: Text(
                                                        "Full Name",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    buildTextField('Full Name'),
                                                    SizedBox(height: 25),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 250),
                                                      child: Text(
                                                        "Phone Number",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    buildNumberField(
                                                        'Phone Number'),
                                                    SizedBox(height: 25),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 180),
                                                      child: Text(
                                                        "Additional Phone Number",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15),
                                                    buildNumberField(
                                                        'Additional Phone Number'),
                                                    SizedBox(height: 35),
                                                    SizedBox(
                                                      width: double.infinity,
                                                      child: buttonWidget(
                                                        buttonAction: () {},
                                                        buttonColor:
                                                            Color(0xFF3A953C),
                                                        buttonText:
                                                            'Add Address',
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            "Add Addres",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (_, index) {
                return Container(
                  margin:
                      EdgeInsets.only(bottom: 16, top: 0, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "David Fayemi",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Railway Quarters , tejuosho, Surulere ,Lagos, \nSurulere (Ojuelegba), Lagos \n+2348074057767",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "change",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //Image.asset("assets/arrowforward.png"),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline_outlined),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Divider(
                        color: Color(0xFFF5F5F5),
                        // color: Colors.grey,
                        thickness: 1,
                        height: 0,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      "Billing address",
                      style: TextStyle(
                        fontSize: 23,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height /
                                    100 *
                                    50,
                                decoration: BoxDecoration(color: Colors.white),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "New Address",
                                              style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(Icons.cancel_sharp),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 270),
                                                    child: Text(
                                                      "Full Name",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  buildTextField('Full Name'),
                                                  SizedBox(height: 25),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 250),
                                                    child: Text(
                                                      "Phone Number",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  buildNumberField(
                                                      'Phone Number'),
                                                  SizedBox(height: 25),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 180),
                                                    child: Text(
                                                      "Additional Phone Number",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  SizedBox(height: 15),
                                                  buildNumberField(
                                                      'Additional Phone Number'),
                                                  SizedBox(height: 35),
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: buttonWidget(
                                                      buttonAction: () {},
                                                      buttonColor:
                                                          Color(0xFF3A953C),
                                                      buttonText: 'Add Address',
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Add Addres",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (_, index) {
                return Container(
                  margin:
                      EdgeInsets.only(bottom: 16, top: 0, left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "David Fayemi",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Railway Quarters , tejuosho, Surulere ,Lagos, \nSurulere (Ojuelegba), Lagos \n+2348074057767",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.2,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "change",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          //Image.asset("assets/arrowforward.png"),

                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.delete_outline_outlined),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Divider(
                        color: Color(0xFFF5F5F5),
                        // color: Colors.grey,
                        thickness: 1,
                        height: 0,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
