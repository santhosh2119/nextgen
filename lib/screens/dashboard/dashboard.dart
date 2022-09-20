import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../widgets/drawer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: DrawerSheet(),),
        appBar: AppBar(
          title: Text(
            "Dashboard",
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Offline Enquiries :  ",
                style: TextStyle(
                  color: ConstantColors().greyFour,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13,
                width: MediaQuery.of(context).size.width * 0.959,
                child: Card(
                  semanticContainer: true,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Offline Enquiries :  "),
                        Text("Total Offline Enquiries :  ")
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
