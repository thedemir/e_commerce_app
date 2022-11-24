import 'dart:developer';
import 'package:e_commerce_app/model/get_category_model.dart';
import 'package:e_commerce_app/service/categories/get_category_service.dart';
import 'package:flutter/cupertino.dart';

class GetCategoryState extends ChangeNotifier {
  var service = GetCategoryService();
  List<Data>? products;

  Future fetch(int id) async {
    products = await service.getCategory(id);

    log(" FETCH getcategory >>>>> ${products?[0].image}");
    return products;
  }
}
