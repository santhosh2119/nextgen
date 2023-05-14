import 'package:flutter/material.dart';
import 'package:nextgen/models/service_model.dart';
import 'package:nextgen/screens/details/full_profile_details.dart';

import 'all_services.dart';
import '../widgets/section_title.dart';
import 'service_card.dart';

class CustomService extends StatelessWidget {
  final List<Service> data;
  final bool status;
  final String title;
  const CustomService({
    Key? key,
    this.status = false,
    required this.title,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: status
              ? const EdgeInsets.symmetric(
                  horizontal: 10.0,
                )
              : const EdgeInsets.symmetric(horizontal: 0.0),
          child: SectionTitle(
            title: title,
            pressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AllServices(
                            title: title,
                          )));
            },
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: status
              ? MediaQuery.of(context).size.height * 0.9
              : MediaQuery.of(context).size.height * 0.125,
          child: ListView.builder(
            scrollDirection: status ? Axis.vertical : Axis.horizontal,
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
                              FullProfileDetails(data: data[index]),
                        ),
                      );
                      // Provider.of<ServiceDetailsService>(context, listen: false)
                      //     .fetchServiceDetails(
                      //         provider.topServiceMap[i]['serviceId']);
                    },
                    child: ServiceCard(
                      status:data[index].status ,
                      name: data[index].customerName,
                      problem: data[index].problem,
                      buttonText: 'View',
                      home: true,
                      width: status
                          ? MediaQuery.of(context).size.width - 50
                          : MediaQuery.of(context).size.width - 80,
                      marginRight: status ? 0.0 : 17.0,
                      pressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                FullProfileDetails(data: data[index]),
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
                  const SizedBox(
                    height: 10,
                  ),
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
