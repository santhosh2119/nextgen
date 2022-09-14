import 'package:flutter/material.dart';

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
          title: const Text('Page 1'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
