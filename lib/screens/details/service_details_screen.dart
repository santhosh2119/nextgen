import 'package:nextgen/models/due_list_model.dart';
import 'package:flutter/material.dart';
import 'package:nextgen/providers/get_users_services_provider.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../widgets/app_bar.dart';
import 'full_profile_details.dart';

class ServiceDetailsScreen extends StatefulWidget {
  final String mobile;
  final String name;
  const ServiceDetailsScreen(
      {required this.mobile, required this.name, Key? key})
      : super(key: key);

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen> {
  late List<DueList> userServices;

  bool _loading = false;
  @override
  void didChangeDependencies() async {
    setState(() {
      _loading = true;
    });
    final services =
        await Provider.of<getUsersServicesProvider>(context, listen: false)
            .getUserServices(widget.mobile);

    setState(() {
      userServices = services;

      _loading = false;
    });
    super.didChangeDependencies();
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
      appBar: AppBar(
        title: Text(widget.name),
        actions: [
          IconButton(
              onPressed: () {
                __bottomSheet(context, widget.mobile);
              },
              icon: const Icon(Icons.qr_code)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call))
        ],
      ),
      body: _loading
          ? LoadingScreen()
          : ListView.builder(
              itemCount: userServices.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 25),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(9)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                FullProfileDetails(data: userServices[index]),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonHelper().titleCommon('Service Id'),
                              CommonHelper()
                                  .titleCommon(userServices[index].serviceId),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: CommonHelper().bRow(
                                'Status',
                                userServices[index].status == "0"
                                    ? "Pending"
                                    : "Completed",
                                color: userServices[index].status == "0"
                                    ? Colors.red
                                    : Color(0xff475467)),
                          ),
                          Container(
                            child: CommonHelper()
                                .bRow('Total', userServices[index].billAmount),
                          ),
                          Container(
                            child: CommonHelper().bRow(
                                'Net Amount', userServices[index].netAmount),
                          ),
                          Container(
                            child: CommonHelper().bRow(
                                'Due Anount', userServices[index].dueAmount,
                                lastBorder: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
