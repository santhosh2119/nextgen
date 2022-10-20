import 'package:flutter/material.dart';
import 'package:nextgen/models/user_list_model.dart';
import 'package:nextgen/screens/usersList/Widgets/all_users_list.dart';
import 'package:nextgen/screens/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../../providers/due_list _provider.dart';
import '../widgets/loading.dart';

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  late List<UserList> userList;

  bool _loading = true;
  @override
  void didChangeDependencies() async {
    final data =
        await Provider.of<DueListProvider>(context, listen: false).usersList();

    setState(() {
      userList = data;
      _loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
      ),
      drawer: Drawer(
        child: DrawerSheet(),
      ),
      body: _loading
          ? const LoadingScreen()
          : AllUsersList(
              data: userList,
            ),
    );
  }
}
