import 'dart:convert';

import 'package:aduaba_app/model/category.dart';
import 'package:aduaba_app/model/product.dart';
import 'package:aduaba_app/providers/product_provider.dart';
import 'package:aduaba_app/services/category_api.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CategoryModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<Category> categoryList = [];
  List<Product> productList = [];
  String message = '';

  // CategoryModel() {
  // fetchCategories();
  // }

  HomeState get homeState => _homeState;

  UserPreferences user = UserPreferences();

  // Future<List<Category>> fetchCategories() async {
  //   _homeState = HomeState.Loading;
  //   try {
  // await Future.delayed(Duration(seconds: 5));
  //     final apiCategory = await CategoryApi.instance.getAllCategories();
  //     categoryList = apiCategory;
  //     print(categoryList);
  //     _homeState = HomeState.Loaded;
  //   } catch (e) {
  //     message = '$e';
  //     _homeState = HomeState.Error;
  //   }
  //   notifyListeners();
  //   return categoryList;
  // }

  Future<List<Category>> getAllCategories() async {
    await Future.delayed(Duration(seconds: 5));
    _homeState = HomeState.Loading;
    String token = await user.getToken();
    print("token: $token");
    final getCategory = await http.get(AppUrl.category, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(getCategory.statusCode);
    final List responseBody = jsonDecode(getCategory.body);
    print("response body: ");
    print(responseBody);
    _homeState = HomeState.Loaded;
    var result = responseBody.map((e) => Category.fromJson(e)).toList();
    print(result);

    notifyListeners();
    return result;

    // return json.decode(responseBody);
  }

// Future<List<Category>> fetchCategories() async {
  //   return _fetchCategories();
  // }

  // Future<List<Category>> fetchCategories() async {
  //   _homeState = HomeState.Loading;
  //   try {
  //     // await Future.delayed(Duration(seconds: 5));
  //     final apiCategory = await CategoryApi.instance.getAllCategories();
  //     categoryList = apiCategory;
  //     print(categoryList);
  //     _homeState = HomeState.Loaded;
  //   } catch (e) {
  //     message = '$e';
  //     _homeState = HomeState.Error;
  //   }
  //   notifyListeners();
  //   return categoryList;
  // }
}

class CategoryProductModel extends ChangeNotifier {
  HomeState _homeState = HomeState.Initial;
  List<Category> categoryList = [];
  String message = '';

  CategoryProductModel() {
    // _fetchProductsFromCategory();
  }

  HomeState get homeState => _homeState;

  Future<List<Category>> fetchProductsFromCategory(String name) async {
    return _fetchProductsFromCategory(name);
  }

  Future<List<Category>> _fetchProductsFromCategory(String name) async {
    _homeState = HomeState.Loading;
    try {
      await Future.delayed(Duration(seconds: 5));
      final apiCategory =
          await CategoryApi.instance.getAllProductsFromCategory(name);
      categoryList = apiCategory;
      _homeState = HomeState.Loaded;
    } catch (e) {
      message = '$e';
      _homeState = HomeState.Error;
    }
    notifyListeners();
    return categoryList;
  }
}
