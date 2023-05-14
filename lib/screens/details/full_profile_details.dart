import 'package:flutter/material.dart';
import 'package:nextgen/utils/colors.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../models/service_model.dart';
import '../widgets/app_bar.dart';

class FullProfileDetails extends StatelessWidget {
  final Service data;

  FullProfileDetails({Key? key, required this.data}) : super(key: key);
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

  ConstantColors cc = ConstantColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cc.bgColor,
      appBar: CommonHelper().appbarCommon('Order Details', context, () {
        Navigator.pop(context);
      }),
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonHelper().titleCommon('Client Details'),
                                IconButton(
                                    onPressed: () {
                                      __bottomSheet(context, data.mobile);
                                    },
                                    icon: const Icon(Icons.qr_code))
                              ],
                            ),

                            const SizedBox(
                              height: 25,
                            ),
                            //Service row

                            Container(
                              child: CommonHelper()
                                  .bRow('Name', data.customerName),
                            ),

                            Container(
                              child: CommonHelper().bRow('Email', data.email),
                            ),

                            Container(
                              child: CommonHelper().bRow('Phone', data.mobile),
                            ),
                            Container(
                              child: CommonHelper()
                                  .bRow('Service Number', data.serviceId),
                            ),
                            Container(
                              child: CommonHelper().bRow(
                                  'Address', data.address,
                                  lastBorder: false),
                            )
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonHelper().titleCommon('Device Details'),
                            const SizedBox(
                              height: 25,
                            ),
                            //Service row

                            Container(
                              child: CommonHelper().bRow('Device', data.device),
                            ),
                            Container(
                              child: CommonHelper()
                                  .bRow('Serial Number', data.serialNumber),
                            ),
                            Container(
                              child:
                                  CommonHelper().bRow('Problem', data.problem),
                            ),

                            Container(
                              child: CommonHelper().bRow('Device Description',
                                  data.deviceDescription.toString(),
                                  lastBorder: false),
                            ),
                          ]),
                    ),

                    // Date and schedule
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonHelper().titleCommon('Date & Schedule'),
                            const SizedBox(
                              height: 25,
                            ),
                            //Service row

                            Container(
                              child: CommonHelper()
                                  .bRow('Date', data.date.toString()),
                            ),

                            Container(
                              child: CommonHelper().bRow(
                                  'Schedule', data.date.toString(),
                                  lastBorder: false),
                            ),
                          ]),
                    ),

                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonHelper().titleCommon('Amount Details'),
                            const SizedBox(
                              height: 25,
                            ),
                            //Service row

                            Container(
                              child: CommonHelper().bRow(
                                  'Advance', data.advanceAmount.toString()),
                            ),

                            Container(
                              child: CommonHelper().bRow(
                                  'Estimation', data.estimation,
                                  lastBorder: false),
                            ),
                          ]),
                    ),

                    // Date and schedule
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonHelper().titleCommon('Order Status'),
                            const SizedBox(
                              height: 25,
                            ),
                            Container(
                              child: CommonHelper().bRow('Order status',
                                  data.status == "1" ? "Done" : "Pending",
                                  lastBorder: false),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            data.status == "1"
                                ? SizedBox()
                                : CommonHelper().buttonOrange("Notify", () {}),
                            const SizedBox(height: 8),
                            data.status == "1"
                                ? SizedBox()
                                : CommonHelper()
                                    .buttonOrange("Close this Order", () {})
                          ]),
                    ),
                    //
                  ]),
            )),
      ),
    );
  }
}
