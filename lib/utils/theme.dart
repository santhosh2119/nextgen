import 'colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  ThemeData appTheme() => ThemeData(
        // scaffoldBackgroundColor: ConstantColors().,
        appBarTheme: AppBarTheme(
          color: ConstantColors().primaryColor,
        ),
        // backgroundColor: Colors.grey[300],
        fontFamily: 'Poppins',
        primaryColor: ConstantColors().primaryColor,
      );
}
