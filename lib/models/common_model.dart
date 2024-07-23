class CommonModel {
  bool? success;
  String? message;

  CommonModel({this.success, this.message});

  CommonModel.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.success;
    data['Message'] = this.message;
    return data;
  }
}
