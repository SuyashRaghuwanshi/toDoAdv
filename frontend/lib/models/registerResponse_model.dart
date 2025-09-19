import 'package:frontend/models/user_model.dart';

class RegisterResponseModel {
  UserModel user;
  RegisterResponseModel({required this.user});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(user: json["user"]);
  }
  Map<String, dynamic> toJson() {
    return {"user": user.toJson()};
  }
}
