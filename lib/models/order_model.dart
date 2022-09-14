import 'dart:convert';

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));

String ordersToJson(Orders data) => json.encode(data.toJson());

class Orders {
  Orders({
    required this.id,
    required this.name,
    required this.mobile,
    required this.description,
    required this.advance,
    required this.amount,
    required this.date,
    required this.status,
  });

  final String id;
  final String name;
  final String mobile;
  final String description;
  final String advance;
  final String amount;
  final DateTime date;
  final String status;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        name: json["name"],
        mobile: json["mobile"],
        description: json["description"],
        advance: json["advance"],
        amount: json["amount"],
        date: DateTime.parse(json["date"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobile": mobile,
        "description": description,
        "advance": advance,
        "amount": amount,
        "date": date.toIso8601String(),
        "status": status,
      };
       @override
  String toString() {
    return toJson().toString();
  }
}
