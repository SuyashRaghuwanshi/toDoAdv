class UserModel {
  String id;
  String name;
  String email;
  UserModel({required this.id, required this.name, required this.email});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(id: json["_id"], name: json["name"], email: json["email"]);
  }
  Map<String, dynamic> toJson() {
    return {"_id": id, "name": name, "email": email};
  }

  @override
  String toString() {
    return 'UserModel{id: $id, name: $name, email: $email}';
  }
}
