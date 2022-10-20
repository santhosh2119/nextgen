import 'package:flutter/material.dart';
import 'package:nextgen/models/user_list_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../utils/colors.dart';
import '../widgets/app_bar.dart';

class SingleUserDataScreen extends StatelessWidget {
  final UserList data;
  SingleUserDataScreen({required this.data, Key? key}) : super(key: key);

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
      appBar: AppBar(title: Text(data.name)),
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
                                CommonHelper().titleCommon('User Details'),
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
                              child: CommonHelper().bRow('Name', data.name),
                            ),

                            Container(
                              child: CommonHelper().bRow('Email', data.email),
                            ),

                            Container(
                              child: CommonHelper().bRow('Phone', data.mobile),
                            ),
                            Container(
                              child: CommonHelper()
                                  .bRow('Service Number', data.designation),
                            ),
                            Container(
                              child: CommonHelper().bRow('Address', data.status,
                                  lastBorder: false),
                            )
                          ]),
                    ),

                    //
                  ]),
            )),
      ),
    );
  }
}
