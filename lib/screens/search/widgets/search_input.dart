import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../search.dart';


class SearchInputBar extends StatelessWidget {
  const SearchInputBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.only(bottom: 15),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const SearchScreen()));
          },
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              decoration: BoxDecoration(
                  color: const Color(0xffF5F5F5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        spreadRadius: -2,
                        blurRadius: 13,
                        offset: const Offset(0, 13)),
                  ],
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 126, 126, 126),
                    size: 22,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Search services',
                    style: TextStyle(
                      color: Color.fromARGB(255, 126, 126, 126),
                      fontSize: 14,
                    ),
                  ),
                ],
              )),
        ));
  }
}
