import 'dart:developer';
import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/model/product_model.dart';
import 'package:flutter/cupertino.dart';
import '../../service/product/get_all_products_service.dart';

class GetAllProductsState extends ChangeNotifier {
  var service = GetAllPoductsService();
  List<Data>? products;

  Future fetch() async {
    products = await service.getAllProducts();

    log(" FETCH  >>>>> ${products?[0].image}");
    return products;
  }
}
