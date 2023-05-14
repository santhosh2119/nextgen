import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nextgen/landingScreen.dart';
import 'package:nextgen/screens/dashboard/dashboard.dart';
import 'package:nextgen/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/colors.dart';

class DrawerSheet extends StatefulWidget {
  
  const DrawerSheet({Key? key}) : super(key: key);

  @override
  State<DrawerSheet> createState() => _DrawerSheetState();
}

class _DrawerSheetState extends State<DrawerSheet> {
   String _userData = '';
 Map<String, dynamic> parsedData = {};

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }
Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = prefs.getString('UserData') ?? '';
    setState(() {
      _userData = userData;
      if (_userData.isNotEmpty) {
        parsedData = json.decode(_userData);
      }
    });
  }
Future<void> _clearUserData(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LandingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          color: ConstantColors().primaryColor,
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
      parsedData['userStatus'] =='1'?   ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ):SizedBox(),
        parsedData['userStatus'] =='1'?   Divider(
          color: Colors.black,
        ):SizedBox(),
        parsedData['userStatus'] =='1'?   ListTile(
          leading: const Icon(
            Icons.currency_rupee,
          ),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ):SizedBox(),
       parsedData['userStatus'] =='1'?   Divider(
          color: Colors.black,
        ):SizedBox(),
          ListTile(
          leading: const Icon(
            Icons.logout,
          ),
          title: const Text('LogOut'),
          onTap:(){
            _clearUserData(context);
          }
        ),
      ],
    );
  }
}
