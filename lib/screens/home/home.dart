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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("NextGen")),
        drawer: const Drawer(child: DrawerSheet()),
        body: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: _loading
                ? const LoadingScreen()
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
      ),
    );
  }
}
