import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';
import '../widgets/custom_input.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                    icon: Icons.email,
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
                    icon: Icons.email,
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
                    icon: Icons.email,
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
                    icon: Icons.email,
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
                    icon: Icons.email,
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
