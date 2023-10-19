import 'package:flutter/material.dart';
import 'package:idcamp_project/model/item.dart';

class CartProvider extends ChangeNotifier {
  List<Item> cartItems = [];
  List<Item> get item => cartItems; //getter

  void toggleCart(Item item) {
    final bool isExist = cartItems.contains(item);

    if (isExist) {
      cartItems.remove(item);
    } else {
      cartItems.add(item);
    }
    notifyListeners();
  }

  bool isExist(Item item) {
    final bool isExist = cartItems.contains(item);
    return isExist;
  }

  void clearFavorite() {
    cartItems = [];
    notifyListeners();
  }
}
