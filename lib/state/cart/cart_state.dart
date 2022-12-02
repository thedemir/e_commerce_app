import 'dart:developer';

import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';

class CartState extends ChangeNotifier {
  Map<Data, int> cart = {};
  List<Data> get cartItems => cart.keys.toList();
  //////////////////////////////////////////////////////
  Map<Data, int> cancelCart = {};
  List<Data> get cancelCartItems => cancelCart.keys.toList();

  void cancelCartAdd(Data product) {
    cancelCart[product] = 1;

    notifyListeners();
  }

  void addFirstToCart(Data product) {
    cart[product] = 1;

    notifyListeners();
  }

  void incrementCart(Data product) {
    if (cart[product] == null) {
      log("ürün sepette yok");
      addFirstToCart(product);
      return;
    } else {
      log("ürün sepette mevcut");
      cart.update(product, (value) => value + 1);
    }
    notifyListeners();
  }

  void delleteProduct(Data product) {
    cart.removeWhere((key, value) => key == product);
    notifyListeners();
  }

  void cleanCart() {
    cart.clear();

    notifyListeners();
  }

  void increseProduct(Data product) {
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
        _total += double.parse("${key.price}") * value;
      });
      totalPrice = double.parse(_total.toStringAsFixed(2));
      return totalPrice;
    }
  }
}
