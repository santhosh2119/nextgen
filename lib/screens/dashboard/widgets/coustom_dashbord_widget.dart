import 'package:flutter/material.dart';

import '../../widgets/app_bar.dart';

class CustomDashboardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String subtitle2;
  final String text;
  final String text2;
  const CustomDashboardWidget(
      {required this.title,
      required this.subtitle,
      required this.subtitle2,
      required this.text,
      required this.text2,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(9)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CommonHelper().titleCommon(title),
        const SizedBox(
          height: 25,
        ),
        //Service row

        Container(
          child: CommonHelper().bRow(subtitle, text),
        ),

        Container(
          child: CommonHelper().bRow(subtitle2, text2, lastBorder: false),
        ),
      ]),
    );
  }
}
