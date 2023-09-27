import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/view/resetpassword.dart';
import 'package:the29029restaurant/view/signup.dart';
import 'package:the29029restaurant/view_models/controller/login/login_view_controller.dart';
import 'package:the29029restaurant/view_models/controller/login/login_view_controller.dart';
import 'package:the29029restaurant/view_models/controller/login/login_view_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

// String ?userNicename;
// String ? userDisplayName;
// String ?token;
String? username;
String? atloginuserid;
String? loginemail;
String? loginPassword;

RxBool loginbuttonused = false.obs;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Login_controller login_controller = Get.put(Login_controller());

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  _submit() {
    // loginbuttonused.value=true;

    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    print('login button pressed');
    loginbuttonused.value = true;
    login_controller.Login_apihit();
    _formKey.currentState!.save();

    loginemail = login_controller.emailController.value.text;
    loginPassword = login_controller.passwordController.value.text;
  }

  bool passwordVisible = true;

  @override
  void initState() {
    login_controller.emailController.value.clear();
    login_controller.passwordController.value.clear();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.1),
                Center(
                  child: Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 30,
                        fontFamily: GoogleFonts.outfit().fontFamily,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: height * 0.05),
                Text("E-mail",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily)),
                SizedBox(height: height * 0.005),
                TextFormField(
                  // cursorColor: Colors.black,
                  controller: login_controller.emailController.value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter email",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
                                color: Color(0xff9796A1),
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffDCDCDC))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffDCDCDC))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                  onFieldSubmitted: (value) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (login_controller.emailController.value.text!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(
                                login_controller.emailController.value.text)) {
                      return 'enter the vaild email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.outfit().fontFamily),
                ),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller: login_controller.passwordController.value,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: " Enter Password",
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 14,
                                color: Color(0xff9796A1),
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xffD0D2D1),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffDCDCDC))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffDCDCDC))),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                  onFieldSubmitted: (value) {},
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (login_controller
                        .passwordController.value.text!.isEmpty) {
                      return 'enter the valid password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPassword(),
                            ));
                      },
                      child: Text(
                        "Forgot password?",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Color(0xff911FDA)),
                      )),
                ),
                SizedBox(height: height * 0.05),
                Obx(
                  () => Center(
                    child: MyButton(
                        loading: login_controller.loading.value,
                        bgColor: Color(0xff41004C),
                        title: "Login",
                        txtStyle: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                        onTap: !loginbuttonused.value == false
                            ? () {
                                print('99999999999999999999999999999');
                              }
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  _submit();
                                  // login_controller.emailController.value.clear();
                                  // login_controller.passwordController.value.clear();
                                }
                              },
                        height: height * .07,
                        width: width * 0.5),
                  ),
                ),

                // ElevatedButton(onPressed: (){}, child: signing?CircularProgressIndicator() :Text("Signup")

                SizedBox(height: height * 0.01),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(indent: 35, color: Color(0xffDCDCDC))),
                  Text("  sign in with  ",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: GoogleFonts.outfit().fontFamily)),
                  Expanded(
                      child: Divider(endIndent: 35, color: Color(0xffDCDCDC))),
                ]),
                SizedBox(height: height * 0.001),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/facebook.png"),
                    SizedBox(width: width * 0),
                    Image.asset("assets/images/google.png"),
                  ],
                ),
                Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account?",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily)),
                        TextSpan(
                            text: " Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xff41004C),
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignUp(),
                                    ));
                              })
                      ])),
                      SizedBox(height: height * 0.05),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to retrieve data
  // Future<Map<String, dynamic>> retrieveData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //
  //   return {
  //     'token': prefs.getString('token'),
  //     'user_email': prefs.getString('user_email'),
  //     'user_nicename': prefs.getString('user_nicename'),
  //     'user_display_name': prefs.getString('user_display_name'),
  //     'user_id': prefs.getInt('user_id'),
  //     // similarly, retrieve username and password if needed
  //   };
  // }
}
