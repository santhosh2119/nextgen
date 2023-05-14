import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nextgen/screens/auth/login.dart';
import 'package:nextgen/screens/home/home.dart';
import 'package:nextgen/screens/users/users_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}


class _LandingScreenState extends State<LandingScreen> {
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
  @override
  Widget build(BuildContext context) {
    
     
    return  _userData==''? LoginScreen(): parsedData['userStatus'] =='1'? Home():UserScreen();
  } 
}