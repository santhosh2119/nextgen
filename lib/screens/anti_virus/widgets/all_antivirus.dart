import 'package:flutter/material.dart';
import 'package:nextgen/models/anitvirus_model.dart';
import '../../services/service_card.dart';
import '../../widgets/app_bar.dart';

class AllAntiVirus extends StatelessWidget {
  final List<AntiVirus> data;
  final String status;
  final String title;
  const AllAntiVirus({
    Key? key,
    required this.title,
    required this.status,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonHelper().appbarCommon("Anti Virus", context, () {
        Navigator.pop(context);
      }),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: status == "Home"
                ? 85
                : MediaQuery.of(context).size.height * 0.8,
            child: ListView.builder(
              scrollDirection:
                  status == "Home" ? Axis.horizontal : Axis.vertical,
              shrinkWrap: true,
              clipBehavior: Clip.none,
              itemCount: status == "Home" ? 5 : data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute<void>(
                        //     builder: (BuildContext context) =>
                        //         const ServiceDetailsPage(),
                        //   ),
                        // );
                        // Provider.of<ServiceDetailsService>(context, listen: false)
                        //     .fetchServiceDetails(
                        //         provider.topServiceMap[i]['serviceId']);
                      },
                      child: ServiceCard(
                        status:data[index].status ,
                        name: data[index].name,
                        problem: data[index].mobile,
                        buttonText: 'View',
                        width: status == "Home"
                            ? MediaQuery.of(context).size.width - 85
                            : MediaQuery.of(context).size.width - 50,
                        marginRight: status == "Home" ? 17.0 : 0.0,
                        pressed: () {
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
                      height: status == "Home" ? 0.0 : 10,
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
      ),
    );
  }
}
