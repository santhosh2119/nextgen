import 'package:flutter/material.dart';
import 'package:nextgen/models/service_model.dart';
import 'package:nextgen/providers/service_completed_provider.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../categories/category.dart';
import '../search/widgets/search_input.dart';
import '../services/custom_service.dart';
import '../widgets/drawer.dart';
import '../widgets/section_title.dart';
import 'app_profile_bar.dart';
import 'image_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Service> pendingService;
  late List<Service> completedService;
  final int user = 1;
  bool _loading = false;

  @override
  void didChangeDependencies() async {
    setState(() {
      _loading = true;
    });
    final pending = await Provider.of<ServiceProvider>(context, listen: false)
        .serviceCompleted('pending', "3");

    final completed = await Provider.of<ServiceProvider>(context, listen: false)
        .serviceCompleted('completed', "3");

    setState(() {
      completedService = completed;
      pendingService = pending;

      _loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("NextGen")),
      drawer: const Drawer(child: DrawerSheet()),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: _loading
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 1,
                  child: const LoadingScreen())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppProfileBar(name: "Santhosh"),
                    const SizedBox(
                      height: 30,
                    ),
                    const SearchInputBar(),
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
                    user == 3 ? ImageSlider() : const SizedBox(),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          SectionTitle(
                            title: 'Services List  ',
                            pressed: () {},
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Categories(),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  right: 2,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ConstantColors().borderColor),
                                    borderRadius: BorderRadius.circular(9)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.abc,
                                      size: 30,
                                      color: ConstantColors().warningColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "pendingService",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: ConstantColors().greyFour,
                                        fontSize: 13,
                                        height: 1.4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                  right: 2,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: ConstantColors().borderColor),
                                    borderRadius: BorderRadius.circular(9)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.abc,
                                      size: 30,
                                      color: ConstantColors().warningColor,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "pendingService",
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: ConstantColors().greyFour,
                                        fontSize: 13,
                                        height: 1.4,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CustomService(
                            data: pendingService,
                            title: "Recently Pending",
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomService(
                            data: completedService,
                            title: "Recently Completed",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
