import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class AppProfileBar extends StatelessWidget {
  final String name;
  const AppProfileBar({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          //name
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome!',
                style: TextStyle(
                  color: ConstantColors().greyParagraph,
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                name,
                style: TextStyle(
                  color: ConstantColors().greyFour,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )),

          //profile image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/icon.png',
              height: 52,
              width: 52,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
