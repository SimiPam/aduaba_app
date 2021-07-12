import 'package:aduaba_app/controllers/card_notifier.dart';
import 'package:aduaba_app/controllers/notifier_card.dart';
import 'package:aduaba_app/model/add_new_card_moderl.dart';
import 'package:aduaba_app/model/card_detail_model.dart';
import 'package:aduaba_app/widgets/card_carousel.dart';
import 'package:flutter/material.dart';
import 'package:paystack_manager/paystack_pay_manager.dart';
import 'package:provider/provider.dart';
import '../utilities/constants.dart';
import 'confirmation_screen.dart';

final List<CardModel> cards = [
  CardModel(
      cardNo: "3282328232823282",
      cardType: "VISA",
      name: "Aycan Doganlar",
      expDate: "09/23"),
  CardModel(
      cardNo: "3282328232823282",
      cardType: "MasterCard",
      name: "Aycan Doganlar",
      expDate: "09/23"),
  CardModel(
      cardNo: "3282328232823282",
      cardType: "VISA",
      name: "Aycan Doganlar",
      expDate: "09/23"),
  CardModel(
      cardNo: "3282328232823282",
      cardType: "VISA",
      name: "Aycan Doganlar",
      expDate: "09/23"),
  CardModel(
      cardNo: "3282328232823282",
      cardType: "MasterCard",
      name: "Aycan Doganlar",
      expDate: "09/23"),
  CardModel(
      cardNo: "3282328232823282",
      cardType: "VISA",
      name: "Aycan Doganlar",
      expDate: "09/23"),
];

class CardSelection extends StatefulWidget {
  CardSelection();

  @override
  _CardSelectionState createState() => _CardSelectionState();
}

class _CardSelectionState extends State<CardSelection> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String message = '';
  AddNewCard cardList;
  Future<AddNewCard> cardAlbum;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    NotifierCard notifierCard = Provider.of<NotifierCard>(context);
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
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
                          child: Image.asset('assets/filled.png')),
                      Positioned(
                        top: 9,
                        right: 10,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5 - 40,
                          child: Divider(
                            color: Color(0xFF3A953C),
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
            Padding(
              padding: EdgeInsets.only(left: 24, right: 24, bottom: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: Color(0xFF10151A)),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      _addCardModalBottomSheet(context);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Color(0xFF3E3E3E),
                      size: 18,
                    ),
                    label: Text(
                      "Add New Card",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Color(0xFF3E3E3E)),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: CardCarousel(),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: notifierCard.cardList.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 24.0,
                      right: 24,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Consumer<CardNotifier>(
                          builder: (
                            _,
                            notifier,
                            __,
                          ) =>
                              Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image(
                                  image:
                                      AssetImage("assets/mastercardlogo.png"),
                                ),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Text(
                                ' ${notifier.cardList[index].cardNumber}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Consumer<CardNotifier>(
                          builder: (
                            _,
                            notifier,
                            __,
                          ) =>
                              // IconButton(
                              //   onPressed: () => notifier.deleteCard(index),
                              //   icon: Icon(Icons.delete_forever),
                              // )
                              InkWell(
                            onTap: () => notifier.deleteCard(index),
                            child: SizedBox(
                              width: 20,
                              height: 30,
                              child: Image.asset('assets/trash.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 33),
        child: buttonWidget(
            buttonText: "Pay Now",
            buttonColor: Color(0xFF3A953C),
            buttonAction: () {
              _processPayment();
            }),
      ),
    );
  }

  void _processPayment() {
    try {
      PaystackPayManager(context: context)
        ..setSecretKey(kSECRET_KEY)
// Your company Image
        ..setCompanyAssetImage(Image(
          image: AssetImage("assets/landing_image.png"),
        ))
        ..setAmount(
            100000) // you need to add two zeros at the end e.g 100000 = N1,000.00
// you can set your own unique transaction reference, here am using timestamp
        ..setReference(DateTime.now().millisecondsSinceEpoch.toString())
        ..setCurrency(
            "NGN") // Set currency, the platform only has three currencies, when registering the
        // list of countries listed is the currency that is available for you to use
        ..setEmail("p.pamd18@gmail.com") // user email address and information
        ..setFirstName("Aduaba")
        ..setLastName("Fresh")
        ..setMetadata(
          {
            "custom_fields": [
              {
                "value": "Aduaba", // set this your company name
                "display_name": "Payment_to",
                "variable_name": "Payment_to"
              }
            ]
          },
        )
        ..onSuccesful(_onPaymentSuccessful)
        ..onPending(_onPaymentPending)
        ..onFailed(_onPaymentFailed)
        ..onCancel(_onCancel)
        ..initialize();
    } catch (error) {
      print('Payment Error ==> $error');
    }
  }

  void _onPaymentSuccessful(Transaction transaction) {
    print('Transaction succesful');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) => ConfirmationTab()),
    );
    print(
        "Transaction message ==> ${transaction.message}, Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentPending(Transaction transaction) {
    print('Transaction Pending');
    print("Transaction Ref ${transaction.refrenceNumber}");
  }

  void _onPaymentFailed(Transaction transaction) {
    print('Transaction Failed');
    print("Transaction message ==> ${transaction.message}");
  }

  void _onCancel(Transaction transaction) {
    print('Transaction Cancelled');
  }

  _addCardModalBottomSheet(context) {
    FontWeight _fontWeight = FontWeight.w400;
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        NotifierCard notifierCard = Provider.of<NotifierCard>(context);
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
                                "New Card",
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
                            "Name on Card",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF10151A),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: addressField(
                                Text: 'Card Name',
                                textInputType: TextInputType.name),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Card Number ",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF10151A),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: addressField(
                                Text: 'Card Number',
                                textInputType: TextInputType.number),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Expiry Date",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xFF10151A),
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            decoration: addressField(
                                Text: 'Expiry Date',
                                textInputType: TextInputType.number),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: buttonWidget(
                            buttonText: "Save",
                            buttonColor: Color(0xFF3A953C),
                            buttonAction: () {
                              if (!_formKey.currentState.validate())
                                return _formKey.currentState.save();
                              notifierCard.addCard(
                                AddNewCard(
                                  cardHolderName: cardHolderName,
                                  cardNumber: cardNumber,
                                  ccv: cvvCode,
                                  expiryDate: expiryDate,
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  InputDecoration addressField({
    final Function validator,
    TextInputType textInputType,
    String Text,
    final Function onSaved,
  }) {
    Widget build(BuildContext context) {
      return TextFormField(
        style: TextStyle(
            fontSize: 15,
            color: Color(0xFF10151A),
            fontWeight: FontWeight.w700),
        decoration: addressField(),
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
