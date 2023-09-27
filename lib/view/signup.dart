import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the29029restaurant/view/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/view_models/controller/signup/signup_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';




class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  Signup_controller signup_controller=Get.put(Signup_controller());

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    signup_controller.signup_apihit();
    _formKey.currentState!.save();

  }
  bool passwordVisible = true;

  @override
  void initState() {
    signup_controller.usernameController.value.clear();
    signup_controller.emailController.value.clear();
    signup_controller.passwordController.value.clear();
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
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.1,
                ),
                Center(
                    child: Text(
                  "SignUp",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 30,
                      fontFamily: GoogleFonts.outfit().fontFamily,
                      fontWeight: FontWeight.w600),
                )),
                SizedBox(height: height * 0.05),
                Text("Full name",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily)),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller: signup_controller.usernameController.value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your name",
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
                    if (value!.isEmpty) {
                      return 'enter the name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text("E-mail",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily)),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller: signup_controller.emailController.value,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your email",
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
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      return 'enter the vaild email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.02),
                Text("Password",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        fontFamily: GoogleFonts.outfit().fontFamily)),
                SizedBox(height: height * 0.005),
                TextFormField(
                  controller: signup_controller.passwordController.value,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Enter your password",
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
                    if (value!.isEmpty) {
                      return 'enter the valid password';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: height * 0.05),
                Obx(() => Center(
                  child: MyButton(
                    loading: signup_controller.loading.value,
                      bgColor: Color(0xff41004C),
                      title: "Sign Up",
                      txtStyle: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontFamily: GoogleFonts.outfit().fontFamily),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          _submit();


                          // signup_controller.usernameController.value.clear();
                          // signup_controller.emailController.value.clear();
                          // signup_controller.passwordController.value.clear();
                        }
                      },
                      height: height*.07,
                      width: width*0.5),
                ), ),





                SizedBox(height: height * 0.01),
                Row(children: <Widget>[
                  Expanded(
                      child: Divider(indent: 35, color: Color(0xffDCDCDC))),
                  Text("  sign in with  ",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,fontSize: 16,color: Colors.black,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Already have an account?",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w300,
                              fontFamily: GoogleFonts.outfit().fontFamily)),
                      TextSpan(
                          text: " Login",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: 12,fontWeight: FontWeight.w300,color: Color(0xff41004C),
                              fontFamily: GoogleFonts.outfit().fontFamily,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            })
                    ])),
                    SizedBox(height: height * 0.05),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
