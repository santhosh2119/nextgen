import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';

class CustomAppDrawerList extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onpress;
  final bool divider;
  CustomAppDrawerList(
      {required this.title,
      required this.icon,
      required this.onpress,
      required this.divider,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: ConstantColors().primaryColor),
          title: Text(title),
          onTap: () => onpress(),
        ),
        divider
            ? Divider(
                color: Colors.black,
              )
            : SizedBox()
      ],
    );
  }
}
