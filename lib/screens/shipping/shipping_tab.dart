import 'package:aduaba_app/constants.dart';
import 'package:aduaba_app/model/address_model.dart';
import 'package:aduaba_app/widgets/address_radio_item_widget.dart';
import 'package:flutter/material.dart';

class ShippingAddressTab extends StatefulWidget {
  @override
  _ShippingAddressTabState createState() => _ShippingAddressTabState();
}

class _ShippingAddressTabState extends State<ShippingAddressTab> {
  List<AddressModel> sampleData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//add this variable to the method that checks if the cart is empty

    sampleData.add(AddressModel(
      isSelected: false,
      address:
          "Railway Quarters , tejuosho, Surulere ,Lagos, Surulere (Ojuelegba), Lagos",
      number: "+2348074057767",
      name: "David Fayemi",
    ));
    // sampleData.add(AddressModel(
    //   isSelected: false,
    //   address:
    //       "Railway Quarters , tejuosho, Surulere ,Lagos, Surulere (Ojuelegba), Lagos",
    //   number: "+2348074057767",
    //   name: "David Fayemi",
    // ));
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  "Checkout",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF819272),
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 16,
                ),
                Stack(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/filled.png')),
                    Positioned(
                      top: 9,
                      left: 15,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5 - 38,
                        child: Divider(
                          color: Color(0xFF3A953C),
                          // color: Colors.grey,
                          thickness: 4,
                          height: 0,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset('assets/outlined.png')),
                    Positioned(
                      top: 9,
                      right: 16,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5 - 45,
                        child: Divider(
                          color: Color(0xFF999999),
                          // color: Colors.grey,
                          thickness: 4,
                          height: 0,
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topRight,
                        child: Image.asset('assets/outlined.png')),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Billing",
                        style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Payment",
                        style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Confirmation",
                        style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          buildAddressSubTitle(
            "Shipping address",
            () {
              _addAddressModalBottomSheet(context, () {});
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: sampleData.length,
              itemBuilder: (_, index) {
                return InkWell(
                    //highlightColor: Colors.red,
                    splashColor: Colors.blueAccent,
                    onTap: () {
                      if (sampleData.length > 1) {
                        setState(() {
                          sampleData
                              .forEach((element) => element.isSelected = false);
                          sampleData[index].isSelected = true;
                        });
                      }
                    },
                    child: AddressRadioItem(
                        item: sampleData[index], count: sampleData.length));
              },
            ),
          ),
        ],
      ),
    );
  }

  _addAddressModalBottomSheet(context, onPress) {
    FontWeight _fontWeight = FontWeight.w400;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setModalState) {
          return AnimatedContainer(
            height: MediaQuery.of(context).size.height * 0.66,
            duration: Duration(milliseconds: 1000),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Address",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Color(0xFF819272),
                                  fontWeight: FontWeight.w700),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.close)),
                          ],
                        ),
                        SizedBox(
                          height: 34,
                        ),
                        Text(
                          "Full Name",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF10151A),
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        buildAddressInputField(text: "jane doe"),
                        SizedBox(
                          height: 16,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.width,
                          ),
                          child: Text(
                            "Address",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF10151A),
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        buildAddressInputField(text: "Lagos"),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Phone Number",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF10151A),
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        buildAddressInputField(text: "+23408012345678"),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: buttonWidget(
                          buttonText: "Save",
                          buttonColor: Color(0xFF3A953C),
                          buttonAction: onPress),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
