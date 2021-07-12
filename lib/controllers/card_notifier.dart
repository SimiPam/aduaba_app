import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:aduaba_app/model/add_new_card_moderl.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CardNotifier extends ChangeNotifier {
  List<AddNewCard> _cardList = [];

  UserPreferences user = UserPreferences();

  UnmodifiableListView<AddNewCard> get cardList =>
      UnmodifiableListView(_cardList);

  addCard(AddNewCard addNewCard) {
    _cardList.add(addNewCard);
    notifyListeners();
  }

  deleteCard(addNewCard) {
    // _cardList
    //     .removeWhere((addNewCard) => _cardList == cardList[index].cardNumber);

    _cardList.remove(addNewCard);
    notifyListeners();
  }

  // Future<Map<String, dynamic>> registerCard(
  //     String cardNo, String cardName, String exp, String cvv) async {
  //   String token = await user.getToken();
  //   final Map<String, dynamic> apiBodyData = {
  //     "cardHolderName": cardName,
  //     "cardNumber": cardNo,
  //     "expiryDate": exp,
  //     "ccv": cvv
  //   };
  //   // Register register = Register(
  //   //   email: "s1@gmail.com",
  //   //   phoneNumber: "08011111111",
  //   //   firstName: "st",
  //   //   lastName: "st",
  //   //   avataUrl: "assets/cart.png",
  //   //   password: "SimiPam123",
  //   //   confirmPassword: "SimiPam123",
  //   // );
  //
  //   // Register({
  //   // this.userId,
  //   // this.firstName,
  //   // this.lastName,
  //   // this.email,
  //   // this.phoneNumber,
  //   // this.avataUrl,
  //   // this.password,
  //   // this.confirmPassword});
  //
  //   // final Map<String, dynamic> apiBodyData = {
  //   //   "email": "s1@gmail.com",
  //   //   "password": "SimiPam123",
  //   //   "confirmPassword": "SimiPam123",
  //   //   "firstName": "st",
  //   //   "lastName": "pt",
  //   //   "phoneNumber": "08011111111",
  //   //   "username": "simi1",
  //   //   "avataUrl": "assets/cart.png"
  //   // };
  //
  //   return await post(AppUrl.addCard, body: json.encode(apiBodyData), headers: {
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   }).then(onValue).catchError(onError);
  // }
  //
  // notify() {
  //   notifyListeners();
  // }
  //
  // static Future<FutureOr> onValue(Response response) async {
  //   var result;
  //
  //   final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //   print(responseData);
  //
  //   if (response.statusCode == 200) {
  //     print("card added");
  //   } else {
  //     print("card not added");
  //   }
  //
  //   return result;
  // }
  //
  // static onError(error) {
  //   print('the error is $error');
  //   return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  // }
}
