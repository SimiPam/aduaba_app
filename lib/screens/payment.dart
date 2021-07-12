import 'package:aduaba_app/controllers/card_notifier.dart';
import 'package:aduaba_app/model/add_new_card_moderl.dart';
import 'package:aduaba_app/screens/new_card.dart';
import 'package:aduaba_app/services/card_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:aduaba_app/controllers/card_notifier.dart';
import '../utilities/constants.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen();
  // final List<AddNewCard> users;
  // final Function(AddNewCard) onDelete;
  // const PaymentScreen({Key key, this.users, this.onDelete}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String message = '';
  AddNewCard cardList;
  Future<AddNewCard> cardAlbum;

  Future<AddNewCard> _fetchCard(String name) async {
    print(name);
    try {
      await Future.delayed(Duration(seconds: 5));
      final apiCard = await CardApi.instance.getAllCardsfromModel(name);
      cardList = apiCard;
      print(cardList);
    } catch (e) {
      message = '$e';
    }
    return cardList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//add this variable to the method that checks if the cart is empty

    //addressAlbum = _fetchAddress(widget.categoryName);
  }
  // List<AddNewCard> cardList = [];

  // addCard(AddNewCard addNewCard) {
  //   setState(() {
  //     cardList.add(addNewCard);
  //   });
  // }

  // deleteCard(AddNewCard addNewCard) {
  //   setState(() {
  //     cardList.removeWhere(
  //         (_addNewCard) => _addNewCard.cardNumber == addNewCard.cardNumber);
  //   },);
  // }

  @override
  Widget build(BuildContext context) {
    CardNotifier cardNotifier = Provider.of<CardNotifier>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Payment",
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFF819272),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24,
            ),
            child: Text(
              "My Cards",
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF10151A),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: cardNotifier.cardList.length,
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
                                image: AssetImage("assets/mastercardlogo.png"),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 45),
        child: SizedBox(
          width: double.infinity,
          child: buttonWidget(
              buttonAction: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => NewCardScreen(),
                  ),
                );
              },
              buttonColor: Color(0xFF3A953C),
              buttonText: 'Add New Card'),
        ),
      ),
    );
  }
}
