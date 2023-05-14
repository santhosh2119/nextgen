import 'package:flutter/material.dart';
import 'package:nextgen/models/enquiry_model.dart';
import 'package:nextgen/screens/enquiry/widget/enquiry_full_details.dart';

import '../../services/service_card.dart';

class EnquiryList extends StatelessWidget {
  final List<Enquiry> data;
  const EnquiryList({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            FullDetailsEnquiry(data: data[index])),
                  );
                  // Provider.of<ServiceDetailsService>(context, listen: false)
                  //     .fetchServiceDetails(
                  //         provider.topServiceMap[i]['serviceId']);
                },
                child: ServiceCard(
                  status:data[index].status ,
                  // sNo: data[index].uid,
                  name: data[index].name,
                  problem: data[index].problem,
                  buttonText: 'View',
                  width: MediaQuery.of(context).size.width - 80,
                  marginRight: 0.0,
                  pressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              FullDetailsEnquiry(data: data[index])),
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
    );
  }
}
