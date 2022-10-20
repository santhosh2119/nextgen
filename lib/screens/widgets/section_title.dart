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
    return Text(
      title,
      style: TextStyle(
        color: ConstantColors().greyFour,
        fontSize: 17,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
