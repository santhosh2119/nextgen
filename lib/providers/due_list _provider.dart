import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nextgen/models/get_total_model.dart';
import 'package:nextgen/models/user_list_model.dart';
import '../models/due_list_model.dart';
import '../utils/apis.dart';

class DueListProvider extends ChangeNotifier {
  final List<GetTotalData> _getTotal = [];
  List<GetTotalData> get getTotal => _getTotal;
  final List<DueList> _dueList = [];
  List<DueList> get dueList => _dueList;

  final List<UserList> _usersList = [];
  List<UserList> get userList => _usersList;

  Future dueListData() async {
    final url = Uri.parse(Api.dueList);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['ResponseMsg'] == "Due List Get Successfully!!") {
        _dueList.clear();
        for (int i = 0; i < extractedData['DueList'].length; i++) {
          _dueList.add(DueList.fromJson(extractedData['DueList'][i]));
        }
        print(dueList);
        notifyListeners();
        return dueList;
      }
    } catch (e) {
      print(e);
    }
  }

  Future usersList() async {
    final url = Uri.parse(Api.usersLIst);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData['ResponseMsg'] == "Users List Get Successfully!!") {
        _usersList.clear();
        for (int i = 0; i < extractedData['UsersList'].length; i++) {
          _usersList.add(UserList.fromJson(extractedData['UsersList'][i]));
        }
        print(dueList);
        notifyListeners();
        return userList;
      }
    } catch (e) {
      print(e);
    }
  }

  Future getData(from, to) async {
    print(from);
    print(to);
    final url = Uri.parse(Api.GetTotal);
    try {
      final response = await http.post(url, body: {"from": from, "to": to});
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      print(extractedData);
      if (extractedData['ResponseMsg'] == "total List Get Successfully!!") {
        _getTotal.clear();
        for (int i = 0; i < extractedData['total'].length; i++) {
          _getTotal.add(GetTotalData.fromJson(extractedData['total'][i]));
        }

        notifyListeners();
        return getTotal;
      }
    } catch (e) {
      print(e);
    }
  }
}
