import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';

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
      margin: EdgeInsets.only(
        right: marginRight,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: ConstantColors().borderColor),
          borderRadius: BorderRadius.circular(9)),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: ConstantColors().warningColor,
          ),
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
