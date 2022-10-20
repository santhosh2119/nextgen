import 'package:flutter/material.dart';
import 'package:nextgen/models/due_list_model.dart';
import 'package:nextgen/screens/dueList/single_due_list_screen.dart';

import '../../services/service_card.dart';

class DueListWidget extends StatelessWidget {
  final List<DueList> data;
  final String status;
  final String title;
  const DueListWidget(
      {required this.data, required this.status, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 25,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            clipBehavior: Clip.none,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          print("object");
                          return DueListSingleScreen(
                            data: data[index],
                          );
                        }),
                      );
                      // Provider.of<ServiceDetailsService>(context, listen: false)
                      //     .fetchServiceDetails(
                      //         provider.topServiceMap[i]['serviceId']);
                    },
                    child: ServiceCard(
                      name: data[index].customerName,
                      problem: data[index].mobile,
                      buttonText: 'View',
                      width: MediaQuery.of(context).size.width - 50,
                      marginRight: 0.0,
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            print("object");
                            return DueListSingleScreen(
                              data: data[index],
                            );
                          }),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              );
            },
            // scrollDirection: Axis.horizontal,
            // shrinkWrap: true,
            // clipBehavior: Clip.none,
          ),
        ),
      ],
    );
  }
}
