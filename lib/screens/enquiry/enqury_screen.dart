import 'package:flutter/material.dart';
import 'package:nextgen/screens/widgets/drawer.dart';
import 'package:nextgen/utils/colors.dart';

class EnquryScreen extends StatelessWidget {
  const EnquryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enqury"),
      ),
      drawer: Drawer(child: DrawerSheet()),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ConstantColors().primaryColor,
                ),
                height: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.wifi_off,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ConstantColors().primaryColor,
                ),
                height: 80,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.wifi,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
