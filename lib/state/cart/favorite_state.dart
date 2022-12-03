import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/product_model.dart';

class FavoriteState extends ChangeNotifier {
  List<Data> favoriteList = [];

  Icon favoriteIconDeactive = Icon(
    Icons.favorite_outline_rounded,
    size: 22,
    color: Colors.black45,
  );

  Icon favoriteIconActive = Icon(
    Icons.favorite_rounded,
    size: 22,
    color: Colors.red,
  );

  void addToFavorite(Data product) {
    favoriteList.add(product);
    notifyListeners();
  }

  void removeFromFavorite(Data product) {
    favoriteList.remove(product);
    notifyListeners();
  }
}
