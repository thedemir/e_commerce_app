import 'dart:developer';
import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/service/categories/all_categories_service.dart';
import 'package:flutter/cupertino.dart';

class GetAllCategoriesState extends ChangeNotifier {
  var service = AllCategoriesService();
  List<Categories>? categories;

  Future fetch() async {
    categories = await service.getAllCategories();

    log(" FETCH  >>>>> ${categories?[0].title} ");
    return categories;
  }
}