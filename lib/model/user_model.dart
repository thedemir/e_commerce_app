/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = UserModel.fromJson(map);
*/
class UserModel {
  String? message;
  bool? status;
  String? token;
  bool? registerstatus;
  User? user;

  UserModel(
      {this.message, this.status, this.token, this.registerstatus, this.user});

  UserModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    token = json['token'];
    registerstatus = json['register_status'];
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['token'] = token;
    data['register_status'] = registerstatus;
    data['user'] = user!.toJson();
    return data;
  }
}

class User {
  int? id;
  String? uuid;
  String? name;
  String? email;

  User({this.id, this.uuid, this.name, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['uuid'] = uuid;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
