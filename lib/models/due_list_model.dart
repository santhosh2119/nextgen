import 'dart:convert';

DueList dueListFromJson(String str) => DueList.fromJson(json.decode(str));

String dueListToJson(DueList data) => json.encode(data.toJson());

class DueList {
  DueList({
    required this.id,
    required this.serviceId,
    required this.customerName,
    required this.mobile,
    required this.email,
    required this.address,
    required this.device,
    required this.serialNumber,
    required this.problem,
    required this.deviceDescription,
    required this.estimation,
    required this.advanceAmount,
    required this.date,
    required this.status,
    required this.billAmount,
    required this.netAmount,
    required this.dueAmount,
    required this.payId,
  });

  final String id;
  final String serviceId;
  final String customerName;
  final String mobile;
  final String email;
  final String address;
  final String device;
  final String serialNumber;
  final String problem;
  final String deviceDescription;
  final String estimation;
  final String advanceAmount;
  final DateTime date;
  final String status;
  final String billAmount;
  final String netAmount;
  final String dueAmount;
  final String payId;

  factory DueList.fromJson(Map<String, dynamic> json) => DueList(
      id: json["id"],
      serviceId: json["service_id"],
      customerName: json["customer_name"],
      mobile: json["mobile"],
      email: json["email"],
      address: json["address"],
      device: json["device"],
      serialNumber: json["serial_number"],
      problem: json["problem"],
      deviceDescription: json["device_description"],
      estimation: json["estimation"],
      advanceAmount: json["advance_amount"],
      date: DateTime.parse(json["date"]),
      status: json["status"],
      billAmount: json["bill_amount"],
      netAmount: json["net_amount"],
      dueAmount: json["due_amount"],
      payId: json["payid"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "service_id": serviceId,
        "customer_name": customerName,
        "mobile": mobile,
        "email": email,
        "address": address,
        "device": device,
        "serial_number": serialNumber,
        "problem": problem,
        "device_description": deviceDescription,
        "estimation": estimation,
        "advance_amount": advanceAmount,
        "date": date.toIso8601String(),
        "status": status,
        "bill_amount": billAmount,
        "net_amount": netAmount,
        "due_amount": dueAmount,
        "payid": payId,
      };
  @override
  String toString() {
    return toJson().toString();
  }
}
