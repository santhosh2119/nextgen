import 'package:flutter/material.dart';
import 'package:nextgen/models/order_model.dart';
import 'package:nextgen/screens/orders/widgets/orders_list.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../../providers/service_completed_provider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late List<Orders> orders;

  bool _loading = false;
  @override
  void didChangeDependencies() async {
    setState(() {
      _loading = true;
    });
    final data =
        await Provider.of<ServiceProvider>(context, listen: false).orders();
    setState(() {
      orders = data;
      _loading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const LoadingScreen()
          : AllOrderScreen(
              data: orders,
              title: "Orders",
              status: "All",
            ),
    );
  }
}
