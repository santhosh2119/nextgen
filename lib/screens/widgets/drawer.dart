import 'package:flutter/material.dart';
import 'package:nextgen/screens/dashboard/dashboard.dart';
import 'package:nextgen/screens/dueList/due_list_screen.dart';
import 'package:nextgen/screens/enquiry/enqury_screen.dart';
import 'package:nextgen/screens/home/home.dart';
import 'package:nextgen/screens/orders/orders.dart';
import 'package:nextgen/screens/usersList/users_list_screen.dart';
import 'package:nextgen/screens/widgets/drawer_list.dart';

import '../../../utils/colors.dart';
import '../anti_virus/antivirus_screen.dart';

class DrawerSheet extends StatelessWidget {
  const DrawerSheet({Key? key}) : super(key: key);

  void home(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
  }

  void dashboard(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  void dueList(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DueListScreen()));
  }

  void usersList(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => UsersListScreen()));
  }

  void enquiryList(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnquryScreen()));
  }

  // void serviceList(context) {}
  void orderList(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OrdersScreen()));
  }

  void antiVirusList(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AnitVirusScreen()));
  }

  void logout(context) {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            color: ConstantColors().primaryColor,
            child: Image.asset(
              "assets/images/logo.png",
            ),
          ),
          CustomAppDrawerList(
              title: "Home",
              icon: Icons.home,
              divider: true,
              onpress: () {
                home(context);
              }),
          CustomAppDrawerList(
              title: "Dashboard",
              icon: Icons.currency_rupee_outlined,
              divider: true,
              onpress: () {
                dashboard(context);
              }),
          CustomAppDrawerList(
              title: "Due List",
              icon: Icons.hourglass_top,
              divider: true,
              onpress: () {
                dueList(context);
              }),
          CustomAppDrawerList(
              title: "Users List",
              icon: Icons.group,
              divider: true,
              onpress: () {
                usersList(context);
              }),
          CustomAppDrawerList(
              title: "Enquiry List",
              icon: Icons.list_alt,
              divider: true,
              onpress: () {
                enquiryList(context);
              }),
          // CustomAppDrawerList(
          //     title: "Service List",
          //     icon: Icons.receipt_long,
          //     divider: true,
          //     onpress: () {
          //       serviceList(context);
          //     }),
          CustomAppDrawerList(
              title: "orders List",
              icon: Icons.shopping_bag,
              divider: true,
              onpress: () {
                orderList(context);
              }),
          CustomAppDrawerList(
              title: "Anti Virus List",
              icon: Icons.bug_report,
              divider: true,
              onpress: () {
                antiVirusList(context);
              }),
          CustomAppDrawerList(
              title: "Log Out",
              icon: Icons.power_settings_new,
              divider: false,
              onpress: () {
                logout(context);
              }),
        ],
      ),
    );
  }
}
