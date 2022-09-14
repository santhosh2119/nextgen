import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';

import '../../../utils/colors.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.name,
      required this.marginRight,
      required this.icon})
      : super(key: key);
  final String name;

  final IconData icon;
  final double marginRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      margin: EdgeInsets.only(
        right: marginRight,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: ConstantColors().borderColor),
          borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 35,
              width: double.infinity,
              child: Icon(
                icon,
                size: 30,
                color: ConstantColors().warningColor,
              )),
          const SizedBox(
            height: 5,
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ConstantColors().greyFour,
              fontSize: 13,
              height: 1.4,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
