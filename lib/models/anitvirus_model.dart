
import 'dart:convert';

AntiVirus antiVirusFromJson(String str) => AntiVirus.fromJson(json.decode(str));

String antiVirusToJson(AntiVirus data) => json.encode(data.toJson());

class AntiVirus {
  AntiVirus({
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.description,
    required this.amount,
    required this.date,
    required this.status,
  });

  final String id;
  final String name;
  final String email;
  final String mobile;
  final String description;
  final String amount;
  final DateTime date;
  final String status;

  factory AntiVirus.fromJson(Map<String, dynamic> json) => AntiVirus(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        description: json["description"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "description": description,
        "amount": amount,
        "date": date.toIso8601String(),
        "status": status,
      };
       @override
  String toString() {
    return toJson().toString();
  }
}
