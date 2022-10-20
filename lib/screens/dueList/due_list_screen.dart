import 'package:flutter/material.dart';
import 'package:nextgen/models/due_list_model.dart';
import 'package:nextgen/providers/due_list%20_provider.dart';
import 'package:nextgen/screens/dueList/widgets/due_list_wigets.dart';
import 'package:nextgen/screens/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/loading.dart';

class DueListScreen extends StatefulWidget {
  const DueListScreen({Key? key}) : super(key: key);

  @override
  State<DueListScreen> createState() => _DueListScreenState();
}

class _DueListScreenState extends State<DueListScreen> {
  late List<DueList> dueList;

  bool _loading = true;
  @override
  void didChangeDependencies() async {
    final data = await Provider.of<DueListProvider>(context, listen: false)
        .dueListData();

    setState(() {
      dueList = data;
      _loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Due List"),
      ),
      drawer: const Drawer(child: DrawerSheet()),
      body: _loading
          ? const LoadingScreen()
          : DueListWidget(
              data: dueList,
              title: "Orders",
              status: "All",
            ),
    );
  }
}
