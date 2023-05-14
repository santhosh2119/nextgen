import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../../landingScreen.dart';
import '../../providers/service_completed_provider.dart';
import '../../utils/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_input.dart';
import 'login.dart';

class OTPScreen extends StatefulWidget {
  final String mobile;
  final String otp;
  const OTPScreen({required this.mobile, required this.otp, Key? key})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool keepLoggedIn = true;
  String error = '';
  bool iserror = false;
  bool isLoading = false;

  mobile() {
    setState(() {
      iserror = false;
      isLoading = true;
    });
    if (widget.otp != emailController.text) {
      setState(() {
        error = "otp is worng";
        iserror = true;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });

      return Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LandingScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    ConstantColors cc = ConstantColors();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Listener(
        onPointerDown: (_) {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.focusedChild?.unfocus();
          }
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 230.0,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // widget.hasBackButton == true
                  //     ? Positioned(
                  //         top: 30,
                  //         left: 10,
                  //         child: InkWell(
                  //           onTap: () {
                  //             Navigator.pop(context);
                  //           },
                  //           child: Container(
                  //             padding: const EdgeInsets.all(20),
                  //             child: Icon(
                  //               Icons.arrow_back_ios,
                  //               color: cc.greyPrimary,
                  //               size: 20,
                  //             ),
                  //           ),
                  //         ))
                  //     : Container(),
                ],
              ),
              // StreamBuilder(
              // stream: FirebaseAuth.instance.authStateChanges(),
              // builder: (context, snapshot) {
              //   if (snapshot.connectionState == ConnectionState.waiting) {
              //     return const Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (snapshot.hasData) {
              //     Future.delayed(Duration(microseconds: 600), () {
              //       Navigator.pushReplacement<void, void>(
              //         context,
              //         MaterialPageRoute<void>(
              //           builder: (BuildContext context) =>
              //               const LandingPage(),
              //         ),
              //       );
              //     });
              //     return Center(
              //       child: OthersHelper().showLoading(cc.primaryColor),
              //     );
              //   } else if (snapshot.hasError) {
              //     return const Center(
              //       child: Text('something went wrong'),
              //     );
              //   } else {
              // return
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 33,
                      ),
                      CommonHelper().titleCommon("Welcome back! Login"),

                      const SizedBox(
                        height: 33,
                      ),

                      //Name ============>
                      CommonHelper().labelCommon("OTP"),

                      CustomInput(
                        controller: emailController,
                        validation: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length != 10) {
                            return 'Please enter your Mobile Number';
                          }
                          return null;
                        },
                        hintText: "OTP",
                        icon: Icons.phone_android,
                        isNumberField: true,
                        textInputAction: TextInputAction.next,
                      ),

                      //Login button ==================>
                      const SizedBox(
                        height: 13,
                      ),
                      CommonHelper().buttonOrange("Submit", () {
                        mobile();
                      }),
                      //       .buttonOrange("Login", () {
                      // Consumer<LoginService>(
                      //   builder: (context, provider, child) => CommonHelper()
                      //       .buttonOrange("Login", () {
                      //     if (provider.isloading == false) {
                      //       if (_formKey.currentState!.validate()) {
                      //         provider.login(
                      //             emailController.text.trim(),
                      //             passwordController.text,
                      //             context,
                      //             keepLoggedIn);

                      //         // Navigator.pushReplacement<void, void>(
                      //         //   context,
                      //         //   MaterialPageRoute<void>(
                      //         //     builder: (BuildContext context) =>
                      //         //         const LandingPage(),
                      //         //   ),
                      //         // );
                      //       }
                      //     }
                      //   },
                      //           isloading:
                      //               provider.isloading == false ? false : true),
                      // ),

                      const SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          print("ss");
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginScreen();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Already haev an Account ',
                                style: const TextStyle(
                                    color: Color(0xff646464), fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      // recognizer: TapGestureRecognizer(),
                                      // ..onTap = () {
                                      //   Navigator.push(
                                      //       context,
                                      //       MaterialPageRoute(
                                      //           builder: (context) =>
                                      //               const SignupPage()));
                                      // },
                                      text: 'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: cc.primaryColor,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Divider (or)
                      const SizedBox(
                        height: 30,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     Expanded(
                      //         child: Container(
                      //       height: 1,
                      //       color: cc.greyFive,
                      //     )),
                      //     Container(
                      //       width: 40,
                      //       alignment: Alignment.center,
                      //       margin: const EdgeInsets.only(bottom: 25),
                      //       child: Text(
                      //         "OR",
                      //         style: TextStyle(
                      //             color: cc.greyPrimary,
                      //             fontSize: 17,
                      //             fontWeight: FontWeight.w600),
                      //       ),
                      //     ),
                      //     Expanded(
                      //         child: Container(
                      //       height: 1,
                      //       color: cc.greyFive,
                      //     )),
                      //   ],
                      // ),

                      // login with google, facebook button ===========>
                      const SizedBox(
                        height: 20,
                      ),
                      // Consumer<GoogleSignInService>(
                      //   builder: (context, gProvider, child) => InkWell(
                      //       onTap: () {
                      //         if (gProvider.isloading == false) {
                      //           gProvider.googleLogin(context);
                      //         }
                      //       },
                      //       child: LoginHelper().commonButton(
                      //           'assets/icons/google.png', "Login with Google",
                      //           isloading: gProvider.isloading == false
                      //               ? false
                      //               : true)),
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // Consumer<FacebookLoginService>(
                      //   builder: (context, fProvider, child) => InkWell(
                      //     onTap: () {
                      //       if (fProvider.isloading == false) {
                      //         fProvider.checkIfLoggedIn(context);
                      //       }
                      //     },
                      //     child: LoginHelper().commonButton(
                      //         'assets/icons/facebook.png',
                      //         "Login with Facebook",
                      //         isloading:
                      //             fProvider.isloading == false ? false : true),
                      //   ),
                      // ),

                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
              // }
              // }),
            ],
          ),
        ),
      ),
    );
  }
}
