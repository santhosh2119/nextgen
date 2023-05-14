import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:nextgen/screens/accounts/create_account.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:nextgen/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/service_model.dart';
import '../../providers/service_completed_provider.dart';
import '../details/full_profile_details.dart';
import '../services/service_card.dart';
import '../widgets/app_bar.dart';
import '../widgets/drawer.dart';
import 'create_request.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool _search = true;
  bool _nodata = true;
  late List<Service> data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSearch("9000953970");
  }

  Future getSearch(title) async {
    print("object");
    setState(() {
      _nodata = false;
      _search = false;
    });
    final search = await Provider.of<ServiceProvider>(context, listen: false)
        .search(title);
    print(search);
    setState(() {
      data = search;
      print(data.length);
      _search = true;
    });
  }

  void __bottomSheet(context, number) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => Container(
        height: MediaQuery.of(context).size.height * 0.6,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 16.0),
          child: Column(
            children: [
              QrImage(
                data: number,
                version: QrVersions.auto,
                size: 250.0,
              ),
              const Spacer(),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back"))
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerSheet(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateRequest();
          }));
        },
        backgroundColor: ConstantColors().primaryColor,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Dashboard",
        ),
      ),
      body: !_search
          ? LoadingScreen()
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonHelper().labelCommon('Your Services'),
                  ListView.builder(
                    shrinkWrap: true,

                    // clipBehavior: Clip.none,
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
                              status: data[index].status,
                              name: data[index].customerName,
                              problem: data[index].problem,
                              buttonText: 'View',
                              width: MediaQuery.of(context).size.width - 40,
                              marginRight: 0.0,
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
                ],
              ),
            ),
    );
  }
}
