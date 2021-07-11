import 'package:aduaba_app/controllers/address_notifier.dart';
import 'package:aduaba_app/model/address_model.dart';
import 'package:aduaba_app/services/address_api.dart';

import 'package:aduaba_app/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingDetailsScreen extends StatefulWidget {
  ShippingDetailsScreen();
  // const ShippingDetailsScreen({Key key}) : super(key: key);

  @override
  _ShippingDetailsScreenState createState() => _ShippingDetailsScreenState();
}

class _ShippingDetailsScreenState extends State<ShippingDetailsScreen> {
  String fullName = '';
  String address = '';
  String phoneNumber = '';
  String message = '';
  AddressModel addressList;
  Future<AddressModel> addressAlbum;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<AddressModel> _fetchAddress(String name) async {
    print(name);
    try {
      await Future.delayed(Duration(seconds: 5));
      final apiAddress = await AddressApi.instance.getAllAddressFromModel(name);
      addressList = apiAddress;
      print(addressList);
    } catch (e) {
      message = '$e';
    }
    return addressList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//add this variable to the method that checks if the cart is empty

    //addressAlbum = _fetchAddress(widget.categoryName);
  }

  @override
  @override
  Widget build(BuildContext context) {
    AddressNotifier addressNotifier = Provider.of<AddressNotifier>(context);
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
                                                    TextFormField(
                                                      decoration:
                                                          addressInputField(
                                                              Text:
                                                                  'Full Name'),
                                                    ),
                                                    SizedBox(height: 25),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              right: 250),
                                                      child:
                                                          formTextTitle(Text),
                                                    ),
                                                    SizedBox(height: 15),
                                                    TextFormField(
                                                      decoration:
                                                          addressInputField(
                                                              Text: 'Address'),
                                                    ),
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
                                                    TextFormField(
                                                      decoration:
                                                          addressInputField(
                                                              Text:
                                                                  'Phone Number'),
                                                    ),
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
              itemCount: addressNotifier.addressList.length,
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
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        Text(
                                      ' ${notifier.addressList[index].name}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        Text(
                                      ' ${notifier.addressList[index].address}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        Text(
                                      ' ${notifier.addressList[index].number}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        SizedBox(
                                      width: double.infinity,
                                      child: buttonWidget(
                                        buttonAction: () {
                                          if (!_formKey.currentState.validate())
                                            return _formKey.currentState.save();
                                          addressNotifier.addAddress(
                                            AddressModel(
                                                name: fullName,
                                                address: address,
                                                number: phoneNumber),
                                          );
                                        },
                                        buttonColor: Color(0xFF3A953C),
                                        buttonText: 'Add Address',
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
                                                        const EdgeInsets.all(
                                                            18.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 270),
                                                          child: Text(
                                                            "Full Name",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        TextFormField(
                                                          decoration:
                                                              addressInputField(
                                                                  Text:
                                                                      'Full Name'),
                                                        ),
                                                        SizedBox(height: 25),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 250),
                                                          child: Text(
                                                            "Address",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        TextFormField(
                                                          decoration:
                                                              addressInputField(
                                                                  Text:
                                                                      'Address'),
                                                        ),
                                                        SizedBox(height: 25),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 180),
                                                          child: Text(
                                                            "Additional Phone Number",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(height: 15),
                                                        TextFormField(
                                                          decoration:
                                                              addressInputField(
                                                                  Text:
                                                                      'Phone Number'),
                                                        ),
                                                        SizedBox(height: 35),
                                                        SizedBox(
                                                          width:
                                                              double.infinity,
                                                          child: buttonWidget(
                                                            buttonAction: () {
                                                              if (!_formKey
                                                                  .currentState
                                                                  .validate())
                                                                return _formKey
                                                                    .currentState
                                                                    .save();
                                                              addressNotifier
                                                                  .addAddress(
                                                                AddressModel(
                                                                    name:
                                                                        fullName,
                                                                    address:
                                                                        address,
                                                                    number:
                                                                        phoneNumber),
                                                              );
                                                            },
                                                            buttonColor: Color(
                                                                0xFF3A953C),
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
              itemCount: addressNotifier.addressList.length,
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
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        Text(
                                      ' ${notifier.addressList[index].name}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        Text(
                                      ' ${notifier.addressList[index].address}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        Text(
                                      ' ${notifier.addressList[index].number}',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Consumer<AddressNotifier>(
                                    builder: (
                                      _,
                                      notifier,
                                      __,
                                    ) =>
                                        SizedBox(
                                      width: double.infinity,
                                      child: buttonWidget(
                                        buttonAction: () {
                                          if (!_formKey.currentState.validate())
                                            return _formKey.currentState.save();
                                          addressNotifier.addAddress(
                                            AddressModel(
                                              name: fullName,
                                              address: address,
                                              number: phoneNumber,
                                            ),
                                          );
                                        },
                                        buttonColor: Color(0xFF3A953C),
                                        buttonText: 'Add Address',
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

  InputDecoration addressInputField({
    String Text,
    final Function onSaved,
  }) {
    Widget build(BuildContext context) {
      return TextFormField(
        decoration: addressInputField(),
        initialValue: '',
        validator: (String value) {
          if (value.isEmpty) {
            return '$Text is required';
          }

          return null;
        },
        onSaved: onSaved,
      );
    }

    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 13.5, vertical: 16),
      hintStyle: TextStyle(
          color: Color(0xFFBABABA), fontWeight: FontWeight.w400, fontSize: 15),
      filled: true,
      fillColor: Color(0xFFF7F7F7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: Color(0xFFF7F7F7)),
      ),
    );
  }
}
