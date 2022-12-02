import 'dart:developer';

import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';

class CartState extends ChangeNotifier {
  Map<CartProductModel, int> cart = {};
  List<CartProductModel> get cartItems => cart.keys.toList();
  //////////////////////////////////////////////////////
  Map<CartProductModel, int> cancelCart = {};
  List<CartProductModel> get cancelCartItems => cancelCart.keys.toList();

  void cancelCartAdd(CartProductModel product) {
    cancelCart[product] = 1;

    notifyListeners();
  }

  void addFirstToCart(CartProductModel product) {
    cart[product] = 1;

    notifyListeners();
  }

  void incrementCart(CartProductModel product) {
    if (cartItems.contains(product) == false) {
      log("ürün sepette yok");
      addFirstToCart(product);
    } else {
      cart[product] = cart[product]! + 1;
    }
    notifyListeners();
  }

  void delleteProduct(CartProductModel product) {
    cart.removeWhere((key, value) => key == product);
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

  double productTotalMoney(CartProductModel product) {
    double total = 0;

    return total;
  }

  double get cartTotalMoney {
    if (cart.isEmpty) {
      return 0;
    } else {
      double _total = 0.00;
      double totalPrice;
      cart.forEach((key, value) {
        _total += double.parse("${key.product.price}") * value;
      });
      totalPrice = double.parse(_total.toStringAsFixed(2));
      return totalPrice;
    }
  }
}
