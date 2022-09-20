import 'package:flutter/material.dart';
import 'package:nextgen/models/service_model.dart';
import 'package:nextgen/providers/service_completed_provider.dart';
import 'package:nextgen/screens/accounts/create_account.dart';
import 'package:nextgen/screens/details/full_profile_details.dart';
import 'package:nextgen/screens/widgets/app_bar.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:nextgen/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool _search = true;
  bool _nodata = true;
  late List<Service> data;
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
    return SafeArea(
      child: Scaffold(
          appBar: CommonHelper().appbarCommon("Search", context, () {
            Navigator.pop(context);
          }),
          floatingActionButton: FloatingActionButton(
            backgroundColor: ConstantColors().primaryColor,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAccount()));
            },
            child: const Icon(Icons.person_add),
          ),
          body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 19),
                        decoration: BoxDecoration(
                            // color: const Color(0xfff2f2f2),
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: searchController,
                                textInputAction: TextInputAction.done,
                                style: const TextStyle(fontSize: 14),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Search field cannot be null';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    prefixIcon: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        SizedBox(
                                            height: 22.0,
                                            width: 40.0,
                                            child: Icon(
                                              Icons.search,
                                              color: Colors.grey,
                                            )),
                                      ],
                                    ),
                                    suffixIcon: IconButton(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      icon: Icon(
                                        Icons.qr_code,
                                        color: ConstantColors().primaryColor,
                                        size: 22,
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                      },
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: ConstantColors().greyFive),
                                        borderRadius: BorderRadius.circular(9)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                ConstantColors().primaryColor)),
                                    errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                ConstantColors().warningColor)),
                                    focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color:
                                                ConstantColors().primaryColor)),
                                    hintText: 'Search',
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 18)),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                                onPressed: () {
                                  getSearch(searchController.text.trim());
                                },
                                icon: const Icon(Icons.arrow_circle_right)),
                          ],
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      thickness: 1,
                      height: 2,
                      color: ConstantColors().borderColor,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _nodata
                        ? Text("No data")
                        : _search
                            ? data.length == 0
                                ? Text("No User Found")
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),

                                          Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 25),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(9)),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      CommonHelper()
                                                          .titleCommon(
                                                              'Client Details'),
                                                      IconButton(
                                                          onPressed: () {
                                                            __bottomSheet(
                                                                context,
                                                                data[0].mobile);
                                                          },
                                                          icon: const Icon(
                                                              Icons.qr_code))
                                                    ],
                                                  ),

                                                  const SizedBox(
                                                    height: 25,
                                                  ),
                                                  //Service row

                                                  Container(
                                                    child: CommonHelper().bRow(
                                                        'Name',
                                                        data[0].customerName),
                                                  ),

                                                  Container(
                                                    child: CommonHelper().bRow(
                                                        'Email', data[0].email),
                                                  ),

                                                  Container(
                                                    child: CommonHelper().bRow(
                                                        'Phone',
                                                        data[0].mobile),
                                                  ),
                                                  data[0].status == "1"
                                                      ? SizedBox()
                                                      : Container(
                                                          child: CommonHelper().bRow(
                                                              'Service Number',
                                                              data[0]
                                                                  .serviceId),
                                                        ),
                                                  Container(
                                                    child: CommonHelper().bRow(
                                                        'Address',
                                                        data[0].address,
                                                        lastBorder: false),
                                                  )
                                                ]),
                                          ),
                                          data[0].status == "1"
                                              ? SizedBox()
                                              : Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 25),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonHelper()
                                                            .titleCommon(
                                                                'Device Details'),
                                                        const SizedBox(
                                                          height: 25,
                                                        ),
                                                        //Service row

                                                        Container(
                                                          child: CommonHelper()
                                                              .bRow(
                                                                  'Device',
                                                                  data[0]
                                                                      .device),
                                                        ),
                                                        Container(
                                                          child: CommonHelper().bRow(
                                                              'Serial Number',
                                                              data[0]
                                                                  .serialNumber),
                                                        ),
                                                        Container(
                                                          child: CommonHelper()
                                                              .bRow(
                                                                  'Problem',
                                                                  data[0]
                                                                      .problem),
                                                        ),

                                                        Container(
                                                          child: CommonHelper().bRow(
                                                              'Device Description',
                                                              data[0]
                                                                  .deviceDescription
                                                                  .toString(),
                                                              lastBorder:
                                                                  false),
                                                        ),
                                                      ]),
                                                ),

                                          // Date and schedule
                                          data[0].status == "1"
                                              ? SizedBox()
                                              : Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 25),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonHelper().titleCommon(
                                                            'Date & Schedule'),
                                                        const SizedBox(
                                                          height: 25,
                                                        ),
                                                        //Service row

                                                        Container(
                                                          child: CommonHelper()
                                                              .bRow(
                                                                  'Date',
                                                                  data[0]
                                                                      .date
                                                                      .toString()),
                                                        ),

                                                        Container(
                                                          child: CommonHelper()
                                                              .bRow(
                                                                  'Schedule',
                                                                  data[0]
                                                                      .date
                                                                      .toString(),
                                                                  lastBorder:
                                                                      false),
                                                        ),
                                                      ]),
                                                ),

                                          data[0].status == "1"
                                              ? SizedBox()
                                              : Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 25),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonHelper()
                                                            .titleCommon(
                                                                'Amount Details'),
                                                        const SizedBox(
                                                          height: 25,
                                                        ),
                                                        //Service row

                                                        Container(
                                                          child: CommonHelper().bRow(
                                                              'Advance',
                                                              data[0]
                                                                  .advanceAmount
                                                                  .toString()),
                                                        ),

                                                        Container(
                                                          child: CommonHelper()
                                                              .bRow(
                                                                  'Estimation',
                                                                  data[0]
                                                                      .estimation,
                                                                  lastBorder:
                                                                      false),
                                                        ),
                                                      ]),
                                                ),

                                          // status
                                          data[0].status == "1"
                                              ? SizedBox()
                                              : Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 25),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20,
                                                      vertical: 20),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              9)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CommonHelper()
                                                            .titleCommon(
                                                                'Order Status'),
                                                        const SizedBox(
                                                          height: 25,
                                                        ),
                                                        Container(
                                                          child: CommonHelper().bRow(
                                                              'Order status',
                                                              data[0].status ==
                                                                      "1"
                                                                  ? "Done"
                                                                  : "Pending",
                                                              lastBorder:
                                                                  false),
                                                        ),
                                                      ]),
                                                ),
                                          data[0].status == "1"
                                              ? SizedBox()
                                              : CommonHelper().buttonOrange(
                                                  "Notify", () {}),
                                          const SizedBox(height: 8),
                                          data[0].status == "1"
                                              ? SizedBox()
                                              : CommonHelper().buttonOrange(
                                                  "Close this Order", () {})
                                          //
                                        ]),
                                  )
                            : LoadingScreen()
                  ],
                ),
              ))),
    );
  }
}
