import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';

import '../../model/product_model.dart';

class CartState extends ChangeNotifier {
  List<CartProductModel> cart = [];

  void addToCart(CartProductModel product) {
    cart.add(product);
    print(cart.length);
    notifyListeners();
  }

  void removeFromCart(CartProductModel product) {
    cart.remove(product);
    notifyListeners();
  }

  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cart.length; i++) {
      totalPrice += double.parse(cart[i].product.price ?? "0");
    }

    return totalPrice.toStringAsFixed(2);
  }
}
