import 'package:flutter/material.dart';
import 'package:nextgen/screens/home/home.dart';
import 'package:nextgen/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;
  @override
  void initState() {
    getData();
    getNavigate();
    // TODO: implement initState
    super.initState();
  }

  getData() {
    return new Future.delayed(const Duration(milliseconds: 20), () {
      setState(() {
        selected = !selected;
      });
    });
  }

  getNavigate() {
    return new Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
                decoration: BoxDecoration(
                  color: ConstantColors().primaryColor,
                  shape: BoxShape.circle,
                ),
                width: selected ? MediaQuery.of(context).size.width * 1 : 1.0,
                height: selected ? MediaQuery.of(context).size.height * 1 : 2.0,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastOutSlowIn,
                child: SizedBox()),
            Positioned(child: Image.asset("assets/images/logo.png"))
          ],
        ),
      ),
    );
  }
}
