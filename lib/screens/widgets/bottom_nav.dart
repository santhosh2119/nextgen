// import 'package:flutter/material.dart';

// import '../../util/colors.dart';

// class BottomNav extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTabTapped;
//   const BottomNav(
//       {Key? key, required this.currentIndex, required this.onTabTapped})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     ConstantColors cc = ConstantColors();
//     return SizedBox(
//       height: 70,
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         selectedLabelStyle: const TextStyle(fontSize: 12),
//         selectedItemColor: ConstantColors().primaryColor,
//         unselectedItemColor: ConstantColors().greyFour,
//         onTap: onTabTapped, // new
//         currentIndex: currentIndex, // new
//         items: [
//           BottomNavigationBarItem(
//             icon: Container(
//               margin: const EdgeInsets.only(bottom: 6),
//               child: Icon(
//                 Icons.home,
//                 color: currentIndex == 0 ? cc.primaryColor : cc.greyFour,
//               ),
//             ),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Container(
//               margin: const EdgeInsets.only(bottom: 6),
//               child: Icon(
//                 Icons.settings,
//                 color: currentIndex == 1 ? cc.primaryColor : cc.greyFour,
//               ),
//             ),
//             label: 'Settings',
//           ),
//           BottomNavigationBarItem(
//             icon: Container(
//               margin: const EdgeInsets.only(bottom: 6),
//               child: Icon(
//                 Icons.account_circle_sharp,
//                 color: currentIndex == 2 ? cc.primaryColor : cc.greyFour,
//               ),
//             ),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
