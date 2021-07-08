import 'dart:convert';
import 'package:aduaba_app/model/product.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:http/http.dart' as http;

class ProductApi {
  static ProductApi _instance;
  UserPreferences user = UserPreferences();
  ProductApi._();

  static ProductApi get instance {
    if (_instance == null) {
      _instance = ProductApi._();
    }
    return _instance;
  }

  Future<List<Product>> getAllProducts() async {
    String token = await user.getToken();
    final getProduct = await http.get(AppUrl.product, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final List responseBody = jsonDecode(getProduct.body);
    return responseBody.map((e) => Product.fromJson(e)).toList();
  }

  Future<List<Product>> getProductByName(String name) async {
    var result;
    String token = await user.getToken();
    final getProduct = await http
        .get(AppUrl.baseUrl + '/find-productby-name?name=$name', headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    if (getProduct.statusCode == 200) {
      final List responseBody = jsonDecode(getProduct.body);
      result = responseBody.map((e) => Product.fromJson(e)).toList();
    } else if (getProduct.statusCode == 404) {
      result = {
        'status': false,
        'message': json.decode(getProduct.body)['error']
      };
    }
    return result;
  }
}
