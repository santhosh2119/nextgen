import 'package:flutter/material.dart';
import 'package:nextgen/screens/dashboard/dashboard.dart';
import 'package:nextgen/screens/home/home.dart';

import '../../../utils/colors.dart';

class DrawerSheet extends StatelessWidget {
  const DrawerSheet({Key? key}) : super(key: key);

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
        ListTile(
          leading: const Icon(
            Icons.home,
          ),
          title: const Text('Home'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(
            Icons.currency_rupee,
          ),
          title: const Text('Dashboard'),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          },
        ),
        // Divider(
        //   color: Colors.black,
        // )
      ],
    );
  }
}
