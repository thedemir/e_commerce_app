import 'package:e_commerce_app/model/cart_model.dart';
import 'package:flutter/cupertino.dart';

class CartState extends ChangeNotifier {
  List<CartProductModel> cart = [
    CartProductModel(
        1, "asdas", 23, "https://picsum.photos/640/480?random=412", 345, 2),
  ];

  void addToCart(CartProductModel product) {
    cart.add(product);
    notifyListeners();
  }

  void removeFromCart(CartProductModel product) {
    cart.remove(product);
    notifyListeners();
  }
}
