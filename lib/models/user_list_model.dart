import 'dart:convert';

UserList userListFromJson(String str) => UserList.fromJson(json.decode(str));

String userListToJson(UserList data) => json.encode(data.toJson());

class UserList {
  UserList({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.designation,
    required this.mobile,
    required this.status,
  });

  String id;
  String name;
  String email;
  String password;
  String designation;
  String mobile;
  String status;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        designation: json["designation"],
        mobile: json["mobile"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "password": password,
        "designation": designation,
        "mobile": mobile,
        "status": status,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
