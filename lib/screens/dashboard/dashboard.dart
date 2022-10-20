import 'package:flutter/material.dart';
import 'package:nextgen/models/get_total_model.dart';
import 'package:nextgen/screens/dashboard/widgets/coustom_dashbord_widget.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../providers/due_list _provider.dart';
import '../../utils/colors.dart';
import '../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _formkey = GlobalKey<FormState>();
  late List<GetTotalData> getTotalData;
  var from;
  var to;

  bool _loading = true;

  getTotal(from, to) async {
    final data = await Provider.of<DueListProvider>(context, listen: false)
        .getData(from, to);

    setState(() {
      getTotalData = data;
      _loading = false;
    });
  }

  @override
  void initState() {
    getTotal("2020-01-01", "2022-01-01");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: DrawerSheet(),
        ),
        appBar: AppBar(
          title: Text(
            "Dashboard",
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: _loading
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const LoadingScreen())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formkey,
                        child: Row(
                          children: [
                            Expanded(
                              child: DateTimePicker(
                                initialValue: '',
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100),
                                dateLabelText: 'From Date',
                                onChanged: (val) {
                                  setState(() {
                                    from = val;
                                  });
                                },
                                validator: (val) {
                                  if (to > val) {
                                    return null;
                                  }
                                  return "to Data must be greaterthan from data";
                                },
                                onSaved: (val) {},
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DateTimePicker(
                                  
                                  initialValue: '',
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  dateLabelText: 'To Date',
                                  onChanged: (val) {
                                    setState(() {
                                      to = val;
                                    });
                                  },
                                  validator: (val) {
                                    if (from < val) {
                                      return null;
                                    }
                                    return "to Data must be greaterthan from data";
                                  },
                                  onSaved: (val) => print(val),
                                ),
                              ),
                            ),
                            Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ConstantColors().primaryColor,
                                        elevation: 0),
                                    onPressed: () {
                                      getTotal(from, to);
                                    },
                                    child: Text(
                                      "Submit",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.normal),
                                    )))
                          ],
                        ),
                      ),
                    ),
                    CustomDashboardWidget(
                        title: "Enquiries",
                        subtitle: "Total Offine Enquiries",
                        subtitle2: "Total online Enquiries",
                        text: getTotalData[0].offline.toString(),
                        text2: getTotalData[0].online.toString()),
                    CustomDashboardWidget(
                        title: "Services",
                        subtitle: "Total Pending Services",
                        subtitle2: "Total Completed Services",
                        text: getTotalData[0].pending.toString(),
                        text2: getTotalData[0].completed.toString()),
                    CustomDashboardWidget(
                        title: "Payments",
                        subtitle: "Total Service Amount",
                        subtitle2: "Total Spare Amount",
                        text: getTotalData[0].totalAmount,
                        text2: getTotalData[0].spareAmount),
                  ],
                ),
        ));
  }
}
