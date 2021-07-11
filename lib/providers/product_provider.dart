import 'dart:convert';

import 'package:aduaba_app/screens/details_screen.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:flutter/widgets.dart';
import 'package:aduaba_app/model/product.dart';
import 'package:aduaba_app/services/product_api.dart';
import 'package:http/http.dart' as http;

enum HomeState {
  Initial,
  Loading,
  Loaded,
  Error,
}

class ProductModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<Product> products = [];
  String message = '';

  ProductModel() {
    _fetchProducts();
  }

  HomeState get homeState => _homeState;

  Future<void> _fetchProducts() async {
    _homeState = HomeState.Loading;
    try {
      await Future.delayed(Duration(seconds: 5));
      final apiProducts = await ProductApi.instance.getAllProducts();
      products = apiProducts;
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
  }

  Future<void> addFavorite(String productId) async {
    // isLiked = true;
    String token = await UserPreferences().getToken();

    // final url = 'https://flutter-shop-app-b3619.firebaseio.com/userFavorite/$userId/$id.json?auth=$token';
    final Map<String, dynamic> apiBodyData = {"productId": productId};

    try {
      final response = await http
          .post(AppUrl.addWishList, body: json.encode(apiBodyData), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("wishlist add done");
        // return true;
      } else {
        print("wishlist add fail");
        print(response.body);
      }
      // return false;
    } catch (error) {
      print("wishlist add error");
      // return false;
    }
  }

  Future<void> removeFavorite(String productId) async {
    // isLiked = false;
    String token = await UserPreferences().getToken();
    // final Map<String, dynamic> apiBodyData = {"productId": productId};

    final url = Uri.parse(AppUrl.removeWishList);
    final request = http.Request("DELETE", url);
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    request.body = jsonEncode({productId});
    final response = await request.send();
    if (response.statusCode != 200) print("remove failed");
    notifyListeners();
    print("remove successful");
  }

  // Future<List<Product>> searchProducts(name) async {
  //   _homeState = HomeState.Loading;
  //   try {
  //     await Future.delayed(Duration(seconds: 5));
  //     final apiProducts = await ProductApi.instance.getProductByName(name);
  //     products = apiProducts;
  //     _homeState = HomeState.Loaded;
  //   } catch (e) {
  //     message = '$e';
  //     _homeState = HomeState.Error;
  //   }
  //   notifyListeners();
  //   return products;
  // }
}
