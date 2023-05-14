import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/app_bar.dart';
import '../widgets/custom_input.dart';

class CreateRequest extends StatefulWidget {
  const CreateRequest({Key? key}) : super(key: key);

  @override
  State<CreateRequest> createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController problemController = TextEditingController();

  final TextEditingController productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(appBar: AppBar(title: Text('Create Request'),),
    
    body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CommonHelper().labelCommon("Full Name"),
                    CustomInput(
                      controller: nameController,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Full Name';
                        }
                        return null;
                      },
                      hintText: "Full Name",
                      // // icon: Icons.email,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CommonHelper().labelCommon("Problem"),
                    CustomInput(
                  
                      controller: problemController,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Problem';
                        }
                        return null;
                      },
                      hintText: "Problem",
                      // // icon: Icons.email,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CommonHelper().labelCommon("Product"),
                    CustomInput(
                      controller: productController,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your product';
                        }
                        return null;
                      },
                      hintText: "Product",
                      // icon: Icons.email,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                         const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().buttonOrange("Request", () {}),
        ],
      ),
    ),
    
    ));
  }
}