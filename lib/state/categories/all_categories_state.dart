import 'package:e_commerce_app/model/categories_model.dart';
import 'package:e_commerce_app/service/categories/all_categories_service.dart';
import 'package:flutter/cupertino.dart';

class GetAllCategoriesState extends ChangeNotifier {
  var service = AllCategoriesService();
  var datas;
  List<CategoriesModels>? categories;

  void fetc() async {
    datas = await service.getAllCategories();
    categories = service.categories;

    print("fetch ${categories?[1]}");
  }
}
