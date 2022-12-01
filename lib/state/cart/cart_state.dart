import 'dart:developer';

import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';

class CartState extends ChangeNotifier {
  Map<CartProductModel, int> cart = {};

  List<CartProductModel> get cartItems => cart.keys.toList();

  void addFirstToCart(CartProductModel product) {
    cart[product] = 1;
    notifyListeners();
  }

  void incrementCart(CartProductModel product) {
    log(cart[product].toString());
    if (cart[product] == null) {
      addFirstToCart(product);
      return;
    } else {
      cart[product] = cart[product]! + 1;
    }
    notifyListeners();
  }

  void cleanCart() {
    cart.clear();

    notifyListeners();
  }

  void increseProduct(CartProductModel product) {
    if (cart[product] == null) {
      return;
    }
    if (cart[product] == 1) {
      cart.removeWhere((key, value) => key == product);
    } else {
      cart[product] = cart[product]! - 1;
    }
  }

  double get cartTotalMoney {
    if (cart.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      cart.forEach((key, value) {
        _total += double.parse("${key.product.price}") * value;
      });
      return _total;
    }
  }
}
