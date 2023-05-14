// To parse this JSON data, do
//
//     final enquiry = enquiryFromJson(jsonString);

import 'dart:convert';

Enquiry enquiryFromJson(String str) => Enquiry.fromJson(json.decode(str));

String enquiryToJson(Enquiry data) => json.encode(data.toJson());

class Enquiry {
  Enquiry({
    required this.id,
    required this.uid,
    required this.name,
    required this.phone,
    required this.email,
    required this.place,
    required this.problem,
    required this.date,
    required this.status,
    required this.online,
  });

  String id;
  String uid;
  String name;
  String phone;
  String email;
  String place;
  String problem;
  DateTime date;
  String status;
  String online;

  factory Enquiry.fromJson(Map<String, dynamic> json) => Enquiry(
        id: json["id"],
        uid: json["uid"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        place: json["place"],
        problem: json["problem"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
        online: json["online"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uid": uid,
        "name": name,
        "phone": phone,
        "email": email,
        "place": place,
        "problem": problem,
        "date": date.toIso8601String(),
        "status": status,
        "online": online,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
