// To parse this JSON data, do
//
//     final getTotalData = getTotalDataFromJson(jsonString);

import 'dart:convert';

GetTotalData getTotalDataFromJson(String str) =>
    GetTotalData.fromJson(json.decode(str));

String getTotalDataToJson(GetTotalData data) => json.encode(data.toJson());

class GetTotalData {
  GetTotalData({
    required this.from,
    required this.to,
    required this.offline,
    required this.online,
    required this.pending,
    required this.completed,
    required this.spareAmount,
    required this.totalAmount,
  });

  DateTime from;
  DateTime to;
  int offline;
  int online;
  int pending;
  int completed;
  String spareAmount;
  String totalAmount;

  factory GetTotalData.fromJson(Map<String, dynamic> json) => GetTotalData(
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        offline: json["offline"],
        online: json["online"],
        pending: json["pending"],
        completed: json["completed"],
        spareAmount: json["spare_amount"],
        totalAmount: json["total_amount"],
      );

  Map<String, dynamic> toJson() => {
        "from":
            "${from.year.toString().padLeft(4, '0')}-${from.month.toString().padLeft(2, '0')}-${from.day.toString().padLeft(2, '0')}",
        "to":
            "${to.year.toString().padLeft(4, '0')}-${to.month.toString().padLeft(2, '0')}-${to.day.toString().padLeft(2, '0')}",
        "offline": offline,
        "online": online,
        "pending": pending,
        "completed": completed,
        "spare_amount": spareAmount,
        "total_amount": totalAmount,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
