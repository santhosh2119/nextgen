import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/due_list_model.dart';
import '../utils/apis.dart';

class getUsersServicesProvider extends ChangeNotifier {
  final List<DueList> _usersServiceList = [];
  List<DueList> get usersServiceList => _usersServiceList;

  Future getUserServices(String mobile) async {
    final url = Uri.parse(Api.GetUsersServices);
    try {
      final response = await http.post(url, body: {"mobile": mobile});
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['ResponseMsg'] == "Due List Get Successfully!!") {
        _usersServiceList.clear();
        for (int i = 0; i < extractedData['DueList'].length; i++) {
          _usersServiceList.add(DueList.fromJson(extractedData['DueList'][i]));
        }

        notifyListeners();
        return usersServiceList;
      }
    } catch (e) {
      print(e);
    }
  }
}
