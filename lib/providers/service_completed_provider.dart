import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextgen/models/anitvirus_model.dart';
import 'package:nextgen/models/order_model.dart';

import '../models/service_model.dart';
import '../utils/apis.dart';

class ServiceProvider extends ChangeNotifier {
  final List<Service> _search = [];
  List<Service> get searchList => _search;
  final List<Orders> _orders = [];
  List<Orders> get ordersList => _orders;
  final List<AntiVirus> _antiVirus = [];
  List<AntiVirus> get antiVirusList => _antiVirus;
  final List<Service> _completed = [];
  List<Service> get completedList => _completed;
  final List<Service> _pending = [];
  List<Service> get pendingList => _pending;
  Future serviceCompleted(title, limit) async {
    final url = title == "pending"
        ? Uri.parse(Api.pendingServices)
        : Uri.parse(Api.completedServices);

    if (title == "pending") {
      print("called pending");

      print(limit);
      print(url);
      try {
        final response = await http.post(url, body: {"limit": limit});
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;
        _pending.clear();

        if (extractedData['ResponseMsg'] ==
            "Pending Services List Get Successfully!!") {
          for (int i = 0; i < extractedData['Pending List'].length; i++) {
            _pending.add(Service.fromJson(extractedData['Pending List'][i]));
          }
          print(_pending.length);
          notifyListeners();
          return pendingList;

          // print(_completed);
        }
      } catch (e) {
        print(e);
      }
    } else {
      try {
        print("called comm");
        print(url);
        final response = await http.post(url, body: {"limit": limit});
        final extractedData =
            json.decode(response.body) as Map<String, dynamic>;

        if (extractedData['ResponseMsg'] ==
            "Completed Services List Get Successfully!!") {
          _completed.clear();
          for (int i = 0; i < extractedData['Completed List'].length; i++) {
            _completed
                .add(Service.fromJson(extractedData['Completed List'][i]));
          }
          print(_completed.length);
          notifyListeners();
          return completedList;

          // print(_completed);
        }
      } catch (e) {
        print(e);
      }
    }
  }

  Future antiVirus() async {
    final url = Uri.parse(Api.antiVirus);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['ResponseMsg'] == "AntiVirus List Get Successfully!!") {
        _antiVirus.clear();
        for (int i = 0; i < extractedData['AntiVirusList'].length; i++) {
          _antiVirus.add(AntiVirus.fromJson(extractedData['AntiVirusList'][i]));
        }

        notifyListeners();
        return antiVirusList;
      }
    } catch (e) {
      print(e);
    }
  }

  Future orders() async {
    final url = Uri.parse(Api.orders);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['ResponseMsg'] == "Orders List Get Successfully!!") {
        _orders.clear();
        for (int i = 0; i < extractedData['Orderslist'].length; i++) {
          _orders.add(Orders.fromJson(extractedData['Orderslist'][i]));
        }

        notifyListeners();
        return ordersList;
      }
    } catch (e) {
      print(e);
    }
  }

  Future search(title) async {
    final url = Uri.parse(Api.search);
    try {
      final response = await http.post(url, body: {"mobile": title});
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['ResponseMsg'] == "Search List Get Successfully!!") {
        _search.clear();
        for (int i = 0; i < extractedData['SearchList'].length; i++) {
          _search.add(Service.fromJson(extractedData['SearchList'][i]));
        }

        notifyListeners();
        return searchList;
      }
    } catch (e) {
      print(e);
    }
  }
}
