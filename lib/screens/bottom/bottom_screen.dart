// import 'package:flutter/material.dart';
// import 'package:nextgen/models/anitvirus_model.dart';
// import 'package:nextgen/models/order_model.dart';
// import 'package:nextgen/screens/anti_virus/antivirus_screen.dart';
// import 'package:nextgen/screens/home/home.dart';
// import 'package:nextgen/screens/orders/Orders.dart';

// import '../profile/profile.dart';
// import '../widgets/bottom_nav.dart';

// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   DateTime? currentBackPressTime;

//   void onTabTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   int _currentIndex = 0;
//   //Bottom nav pages
//   final List<Widget> _children = [
//     const Home(),
//     const Profile(),
//     const Profile(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: WillPopScope(
//           onWillPop: () {
//             DateTime now = DateTime.now();
//             if (currentBackPressTime == null ||
//                 now.difference(currentBackPressTime!) >
//                     const Duration(seconds: 2)) {
//               currentBackPressTime = now;
//               // OthersHelper().showToast("Press again to exit", Colors.black);
//               return Future.value(false);
//             }
//             return Future.value(true);
//           },
//           child: _children[_currentIndex]),
//       bottomNavigationBar: BottomNav(
//         currentIndex: _currentIndex,
//         onTabTapped: onTabTapped,
//       ),
//     );
//   }
// }
