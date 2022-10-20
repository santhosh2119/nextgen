import 'package:flutter/material.dart';
import 'package:nextgen/models/user_list_model.dart';
import 'package:nextgen/screens/usersList/single_user_details_screen.dart';

import '../../services/service_card.dart';

class AllUsersList extends StatelessWidget {
  final List<UserList> data;
  const AllUsersList({required this.data, Key? key}) : super(key: key);

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
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              SingleUserDataScreen(
                            data: data[index],
                          ),
                        ),
                      );
                      // Provider.of<ServiceDetailsService>(context, listen: false)
                      //     .fetchServiceDetails(
                      //         provider.topServiceMap[i]['serviceId']);
                    },
                    child: ServiceCard(
                      name: data[index].name,
                      problem: data[index].mobile,
                      buttonText: 'View',
                      width: MediaQuery.of(context).size.width - 50,
                      marginRight: 0.0,
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                SingleUserDataScreen(
                              data: data[index],
                            ),
                          ),
                        );
                        // provider.saveOrUnsave(
                        //     provider.topServiceMap[i]['serviceId'],
                        //     provider.topServiceMap[i]['title'],
                        //     provider.topServiceMap[i]['image'],
                        //     provider.topServiceMap[i]['price'],
                        //     provider.topServiceMap[i]['sellerName'],
                        //     twoDouble(provider.topServiceMap[i]['rating']),
                        //     i,
                        //     context,
                        //     provider.topServiceMap[i]['sellerId']);
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
