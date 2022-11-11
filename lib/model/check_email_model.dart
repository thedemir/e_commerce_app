/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = CheckEmailModel.fromJson(map);
*/
class CheckEmailModel {
  String? message;
  bool? status;
  bool? registerstatus;

  CheckEmailModel({this.message, this.status, this.registerstatus});

  CheckEmailModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    registerstatus = json['register_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['register_status'] = registerstatus;
    return data;
  }
}
