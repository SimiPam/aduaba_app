import 'dart:convert';

import 'package:aduaba_app/model/product.dart';
import 'package:aduaba_app/utilities/app_url.dart';
import 'package:aduaba_app/utilities/shared_preference.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Item {
  String id;
  String cartItemId;
  String name;
  String description;
  double unitPrice;
  String imageUrl;
  String categoryName;
  String vendorId;
  bool isAvailable;
  int quantity;

  Item({
    this.id,
    this.name,
    this.description,
    this.unitPrice,
    this.imageUrl,
    this.categoryName,
    this.vendorId,
    this.isAvailable,
    this.quantity,
    this.cartItemId,
  });

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartItemId = json['cartItemId'];
    name = json['name'];
    description = json['description'];
    unitPrice = json['unitPrice'];
    imageUrl = json['imageUrl'];
    categoryName = json['categoryName'];
    vendorId = json['vendorId'];
    isAvailable = json['isAvailable'];
    quantity = json['quantity'];
  }
}

class Cart with ChangeNotifier {
  Map<String, Item> _items = {};

  Map<String, Item> get items {
    return {..._items};
  }

  itemsFromDb() async {
    List<Item> listItem = await getAllCartItems();
    listItem.forEach((element) {
      addItem(
          productId: element.id,
          price: element.unitPrice,
          title: element.name,
          description: element.description,
          imageUrl: element.imageUrl,
          isAvailable: element.isAvailable,
          quantity: element.quantity,
          cartItemId: element.cartItemId);
    });
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach(
        (key, cartItem) => total += cartItem.unitPrice * cartItem.quantity);
    return total;
  }

  double get summaryAmount {
    var total = totalAmount;

    return total + 350;
  }

  Future<void> addCartToDB(productId, quantity) async {
    await Future.delayed(Duration(seconds: 5));
    final Map<String, dynamic> apiBodyData = {
      "productId": productId,
      "quantity": quantity
    };
    String token = await UserPreferences().getToken();
    try {
      final response = await http
          .post(AppUrl.addCart, body: json.encode(apiBodyData), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("done");
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<void> updatedbCart(cartItemId, quantity) async {
    final Map<String, dynamic> apiBodyData = {
      "cartItemId": cartItemId,
      "quantity": quantity
    };
    String token = await UserPreferences().getToken();
    try {
      final response = await http
          .post(AppUrl.addCart, body: json.encode(apiBodyData), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        print("done");
      } else {
        print(response.body);
      }
    } catch (error) {
      print(error.toString());
    }
  }

  Future<List<Item>> getAllCartItems() async {
    await Future.delayed(Duration(seconds: 5));

    String token = await UserPreferences().getToken();

    final getCartItems = await http.get(AppUrl.cart, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(getCartItems.statusCode);
    final List responseBody = jsonDecode(getCartItems.body);
    print(responseBody);

    var result = responseBody.map((e) => Item.fromJson(e)).toList();
    print("Cart result: $result");
    return result;
  }

  void addItem(
      {String productId,
      double price,
      String title,
      String imageUrl,
      String description,
      bool isAvailable,
      int quantity,
      cartItemId}) async {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => Item(
                id: existingCartItem.id,
                description: existingCartItem.description,
                isAvailable: existingCartItem.isAvailable,
                imageUrl: existingCartItem.imageUrl,
                name: existingCartItem.name,
                unitPrice: existingCartItem.unitPrice,
                quantity: existingCartItem.quantity + 1,
              ));
      await updatedbCart(cartItemId, quantity);
    } else {
      _items.putIfAbsent(
          productId,
          () => Item(
                // id: DateTime.now().toString(),
                id: productId,
                name: title,
                unitPrice: price,
                description: description,
                isAvailable: isAvailable,
                imageUrl: imageUrl,
                quantity: 1,
              ));
      await addCartToDB(productId, quantity);
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(
      {String productId, String cartItemId, int quantity}) async {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
        productId,
        (existingCartItem) => Item(
          id: existingCartItem.id,
          name: existingCartItem.name,
          description: existingCartItem.description,
          isAvailable: existingCartItem.isAvailable,
          imageUrl: existingCartItem.imageUrl,
          unitPrice: existingCartItem.unitPrice,
          quantity: existingCartItem.quantity - 1,
        ),
      );
      await updatedbCart(cartItemId, quantity);
    } else {
      _items.remove(productId);
      await removeFromDb(productId);
    }
    notifyListeners();
  }

  Future<void> removeFromDb(productId) async {
    String token = await UserPreferences().getToken();
    // final Map<String, dynamic> apiBodyData = {"productId": productId};

    final url = Uri.parse(AppUrl.removeCart);
    final request = http.Request("DELETE", url);
    request.headers.addAll(<String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    request.body = jsonEncode({"productId": productId});
    final response = await request.send();
    if (response.statusCode != 200) print("remove failed");
    notifyListeners();
    print("remove successful");
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
