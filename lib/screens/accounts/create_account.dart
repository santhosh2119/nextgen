import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/custom_input.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonHelper().labelCommon("Full Name"),
                  CustomInput(
                    controller: emailController,
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
                  CommonHelper().labelCommon("Mobile No"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Mobile No';
                      }
                      return null;
                    },
                    hintText: "Mobile No",
                    // // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Email"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    hintText: "Email",
                    // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Address"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Address';
                      }
                      return null;
                    },
                    hintText: "Address",
                    // // // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Device"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Device';
                      }
                      return null;
                    },
                    hintText: "Device",
                    // // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Serial Number"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Serial Number';
                      }
                      return null;
                    },
                    hintText: "Serial Number",
                    // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Problem"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Problem';
                      }
                      return null;
                    },
                    hintText: "Problem",
                    // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Device Description"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Device Description';
                      }
                      return null;
                    },
                    hintText: "Advance",
                    // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  CommonHelper().labelCommon("Advance"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Advance';
                      }
                      return null;
                    },
                    hintText: "Advance",
                    // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().labelCommon("Estimation"),
                  CustomInput(
                    controller: emailController,
                    validation: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Estimation';
                      }
                      return null;
                    },
                    hintText: "Estimation",
                    // icon: Icons.email,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CommonHelper().buttonOrange("Create", () {}),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
