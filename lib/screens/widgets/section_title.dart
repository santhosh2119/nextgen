import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.pressed,
  }) : super(key: key);

  final String title;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: ConstantColors().greyFour,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: pressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "See all",
                  style: TextStyle(
                    color: ConstantColors().primaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: ConstantColors().primaryColor,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
