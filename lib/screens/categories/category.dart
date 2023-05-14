import 'package:flutter/material.dart';
import 'package:nextgen/screens/anti_virus/antivirus_screen.dart';
import 'package:nextgen/screens/orders/Orders.dart';

import '../services/all_services.dart';
import 'widgets/category_card.dart';

class Categories extends StatelessWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // getLineAwsome("las la-charging-station");
    return Container(
        margin: const EdgeInsets.only(top: 5),
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          clipBehavior: Clip.none,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AllServices(
                              title: "Recently Pending",
                            )));
              },
              child: const CategoryCard(
                name: "Pending",
                marginRight: 17.0,
                icon: Icons.schedule,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AnitVirusScreen()));
              },
              child: const CategoryCard(
                name: "Anti Virus",
                marginRight: 17.0,
                icon: Icons.bug_report,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const OrdersScreen()));
              },
              child: const CategoryCard(
                name: "Orders",
                marginRight: 17.0,
                icon: Icons.shopping_bag,
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                MaterialPageRoute(
                    builder: (context) => AllServices(
                          title: "Recently Compelted",
                        ));
              },
              child: const CategoryCard(
                name: "Completed",
                marginRight: 17.0,
                icon: Icons.task_alt,
              ),
            ),
          ],
        ));
  }
}
