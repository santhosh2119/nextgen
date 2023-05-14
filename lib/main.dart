import 'package:flutter/material.dart';
import 'package:nextgen/landingScreen.dart';
import 'package:nextgen/providers/service_completed_provider.dart';
import 'package:nextgen/screens/home/home.dart';
import 'package:nextgen/screens/users/users_screen.dart';
import 'package:nextgen/utils/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ServiceProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppThemes().appTheme(),
        home: const LandingScreen(),
      ),
    );
  }
}
