import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: ConstantColors().primaryColor,
    ));
  }
}
