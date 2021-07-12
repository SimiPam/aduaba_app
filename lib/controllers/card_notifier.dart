import 'dart:collection';

import 'package:aduaba_app/model/add_new_card_moderl.dart';
import 'package:flutter/material.dart';

class CardNotifier extends ChangeNotifier {
  List<AddNewCard> _cardList = [];

  UnmodifiableListView<AddNewCard> get cardList =>
      UnmodifiableListView(_cardList);

  addCard(AddNewCard addNewCard) {
    _cardList.add(addNewCard);
    notifyListeners();
  }

  deleteCard(index) {
    _cardList
        .removeWhere((addNewCard) => _cardList == cardList[index].cardNumber);
    notifyListeners();
  }
}
