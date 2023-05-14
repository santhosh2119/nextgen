import 'package:flutter/material.dart';
import 'package:nextgen/landingScreen.dart';
import 'package:nextgen/providers/service_completed_provider.dart';
import 'package:nextgen/screens/auth/register.dart';
import 'package:nextgen/screens/home/home.dart';
import 'package:nextgen/screens/widgets/loading.dart';
import 'package:provider/provider.dart';
import '../../utils/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late bool _passwordVisible;

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool keepLoggedIn = true;
   String error ='';
   bool iserror= false;
   bool isLoading= false;

login(){
  setState(() {
     iserror= false;
     isLoading = true;
  });
  final loginData = Provider.of<ServiceProvider>(context, listen:false).
  login(emailController.text, passwordController.text).then((value) {
    print(value);
    if(value =="Invalid username or password"){
      setState(() {
        error = value;
        iserror= true;
        isLoading = false;
      });
    }else{
      setState(() {
          isLoading = false;
      });
 return Navigator.push(context, MaterialPageRoute(builder: (context){
    return LandingScreen();
  }));
    }

  });
 
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
          physics:const BouncingScrollPhysics(),
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

                      //password ===========>
                      CommonHelper().labelCommon("Password"),

                      Container(
                          margin: const EdgeInsets.only(bottom: 19),
                          decoration: BoxDecoration(
                              // color: const Color(0xfff2f2f2),
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: passwordController,
                            textInputAction: TextInputAction.next,
                            obscureText: !_passwordVisible,
                            style: const TextStyle(fontSize: 14),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                prefixIcon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        height: 22.0,
                                        width: 40.0,
                                        child: Icon(
                                          Icons.lock,
                                          color: ConstantColors().primaryColor,
                                        )),
                                  ],
                                ),
                                suffixIcon: IconButton(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _passwordVisible
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    color: Colors.grey,
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ConstantColors().greyFive),
                                    borderRadius: BorderRadius.circular(9)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ConstantColors().primaryColor)),
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ConstantColors().warningColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ConstantColors().primaryColor)),
                                hintText: 'Enter password',
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 18)),
                          )),

                      // =================>
              iserror?   Center(
                child: Text(
                                error,
                              
                                  style: TextStyle(
                                  
                                      color: ConstantColors().primaryColor,
                                      fontWeight: FontWeight.w400,
                                      
                                      fontSize: 14),
                                ),
              ):SizedBox(),

                      //Login button ==================>
                      const SizedBox(
                        height: 13,
                      ),
                     isLoading?LoadingScreen(): CommonHelper().buttonOrange("Login", () {
                    login();
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
                        onTap: (){
                      
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return RegisterScreen();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Don\'t have account?  ',
                                style: const TextStyle(
                                    color: Color(0xff646464), fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                    
                                      text: 'Register',
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
