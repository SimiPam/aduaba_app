import 'package:flutter/widgets.dart';
import 'package:aduaba_app/model/product.dart';
import 'package:aduaba_app/services/product_api.dart';

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
