import 'package:flutter/material.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_input.dart';
import '../widgets/loading.dart';

class BillingScreen extends StatefulWidget {
  final String name;
  final String mobile;
  final String sid;
  const BillingScreen(
      {required this.sid, required this.name, required this.mobile, Key? key})
      : super(key: key);

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  int result = 0;
  billAmount(int netAmount) {
    print(netAmount);
    final int results = int.parse(billAmountController.text) - netAmount;
    print(results);
    setState(() {
      balanceAmountController.text = results.toString();
    });
  }

  bool isLoading = false;

  Future create() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // Provider.of<ServiceProvider>(context, listen: false)
      //     .payment(
      //         widget.sid,
      //         billAmountController.text,
      //         widget.sid,
      //         widget.name,
      //         widget.mobile,
      //         billAmountController.text,
      //         billAmountController.text,
      //         balanceAmountController.text,
      //         "0",
      //         netAmountController.text,
      //         widget.sid,
      //         context)
      //     .then((value) {
      //   setState(() {
      //     isLoading = false;
      //   });
      // });
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController billAmountController = TextEditingController();
  TextEditingController balanceAmountController = TextEditingController();
  TextEditingController netAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Billing Details"),
      ),
      body:  isLoading
          ? LoadingScreen()
          :Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonHelper().labelCommon("Service Charge"),
              CustomInput(
                controller: billAmountController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                hintText: "Service Charge",
                icon: Icons.currency_rupee,
                isNumberField: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 8,
              ),
              CommonHelper().labelCommon("Bill Amount"),
              CustomInput(
                controller: billAmountController,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Bill Amount';
                  }
                  return null;
                },
                hintText: "Bill Amount",
                icon: Icons.currency_rupee,
                isNumberField: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 8,
              ),
              CommonHelper().labelCommon("Balance Amount"),
              CustomInput(
                controller: balanceAmountController,
                // readOnly: true,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Balance Amount';
                  }
                  return null;
                },
                hintText: "Balance Amount",
                icon: Icons.currency_rupee,
                isNumberField: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 8,
              ),
              CommonHelper().labelCommon("Net Amount"),
              CustomInput(
                controller: netAmountController,
                validation: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      int.parse(value) >
                          int.parse(billAmountController.text)) {
                    return 'Please enter correct Net Amount';
                  }
                  return null;
                },
                onChanged: (value) {
                  print(value);
                  billAmount(int.parse(value));
                },
                hintText: "Net Amount",
                icon: Icons.currency_rupee,
                isNumberField: true,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 8,
              ),
              CommonHelper().buttonOrange("Save", create),
            ],
          ),
        ),
      ),
    );
  }
}
