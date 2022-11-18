import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/service/categories/all_categories_service.dart';
import 'package:flutter/cupertino.dart';

class GetAllCategories extends ChangeNotifier {
  var service = AllCategoriesService();
  var datas;

  void fetc() async {
    datas = await service.getAllCategories();
  }
}
