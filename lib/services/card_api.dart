import 'dart:convert';

import 'package:aduaba_app/model/add_new_card_moderl.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';

import 'package:http/http.dart' as http;

class CardApi {
  static CardApi _instance;
  UserPreferences user = UserPreferences();

  CardApi._();

  static CardApi get instance {
    if (_instance == null) {
      _instance = CardApi._();
    }
    return _instance;
  }

  Future<List<AddNewCard>> getAllCards() async {
    final getCard = await http.get(AppUrl.addCard, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    });
    final List responseBody = jsonDecode(getCard.body);
    return responseBody.map((e) => AddNewCard.fromJson(e)).toList();
  }

  Future<AddNewCard> getAllCardsfromModel(String name) async {
    String token = await user.getToken();
    print("token: $token");
    // String search = name.replaceAll(" ", "%20");
    var result;
    final getCard = await http.get(
      // can't find the url
      AppUrl.baseUrl + '/find-categoryby-name?name',
      headers: {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    // print(getCategory.statusCode);
    final Map<String, dynamic> responseBody = jsonDecode(getCard.body);
    print(responseBody);
    AddNewCard addNewCard = AddNewCard.fromJson(responseBody);
    return addNewCard;
  }
}
