class CategoriesModels {
  int? id;
  String? title;
  String? image;
  DateTime? createdat;
  DateTime? updatedat;

  CategoriesModels(
      {this.id, this.title, this.image, this.createdat, this.updatedat});

  CategoriesModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    createdat = json['created_at'];
    updatedat = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['created_at'] = createdat;
    data['updated_at'] = updatedat;
    return data;
  }
}

class Root {
  String? message;
  bool? status;
  List<CategoriesModels?>? categories;

  Root({this.message, this.status, this.categories});

  Root.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['categories'] != null) {
      categories = <CategoriesModels>[];
      json['categories'].forEach((v) {
        categories!.add(CategoriesModels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['categories'] = categories != null
        ? categories!.map((v) => v?.toJson()).toList()
        : null;
    return data;
  }
}
