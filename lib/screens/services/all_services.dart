import 'package:flutter/material.dart';
import 'package:nextgen/models/service_model.dart';
import 'package:nextgen/screens/services/custom_service.dart';
import 'package:provider/provider.dart';

import '../../providers/service_completed_provider.dart';
import '../widgets/loading.dart';

class AllServices extends StatefulWidget {
  final String title;
  const AllServices({Key? key, required this.title}) : super(key: key);

  @override
  State<AllServices> createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  late List<Service> data;

  bool _loading = false;
  @override
  void didChangeDependencies() async {
    setState(() {
      _loading = true;
    });
    final dataGetting =
        await Provider.of<ServiceProvider>(context, listen: false)
            .serviceCompleted(
                widget.title == "Recently Pending" ? "pending" : "completed",
                "all");
    setState(() {
      data = dataGetting;
      _loading = false;
    });

    print(data);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _loading
            ? const LoadingScreen()
            : CustomService(
                title: widget.title,
                data: data,
                status: true,
              ));
  }
}
