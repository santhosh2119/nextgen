import 'package:flutter/material.dart';
import 'package:nextgen/models/enquiry_model.dart';

import '../../widgets/app_bar.dart';

class FullDetailsEnquiry extends StatelessWidget {
  final Enquiry data;
  const FullDetailsEnquiry({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.name),
      ),
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
                            //Service row

                            Container(
                              child: CommonHelper().bRow('Name', data.name),
                            ),

                            Container(
                              child: CommonHelper().bRow('Email', data.email),
                            ),

                            Container(
                              child: CommonHelper().bRow('Phone', data.phone),
                            ),
                            Container(
                              child: CommonHelper()
                                  .bRow('Service Number', data.uid),
                            ),
                            Container(
                              child: CommonHelper().bRow('Address', data.place,
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
                              child:
                                  CommonHelper().bRow('Problem', data.problem),
                            ),
                          ]),
                    ),

                    // Date and schedule

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
                                child: CommonHelper().bRow(
                                    'Status',
                                    data.status == "0"
                                        ? "Pending"
                                        : "Completed",
                                    // color: data.status == "0"
                                    //     ? Colors.red
                                    //     : Color(0xff475467)
                                        )),
                            const SizedBox(
                              height: 25,
                            ),
                          ]),
                    ),
                    //
                  ]),
            )),
      ),
    );
  }
}
