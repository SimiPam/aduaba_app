import 'dart:collection';

import 'package:aduaba_app/model/address_model.dart';
import 'package:flutter/material.dart';

class AddressNotifier extends ChangeNotifier {
  List<AddressModel> _addressList = [];

  UnmodifiableListView<AddressModel> get addressList =>
      UnmodifiableListView(_addressList);

  addAddress(AddressModel addressModel) {
    _addressList.add(addressModel);
    notifyListeners();
  }

  deleteAddress(index) {
    _addressList.removeWhere(
        (addressModel) => _addressList == _addressList[index].address);
    notifyListeners();
  }
}
