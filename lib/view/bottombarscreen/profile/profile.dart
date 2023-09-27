import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/res/components/general_exception.dart';
import 'package:the29029restaurant/res/components/internet_exceptions_widget.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/Update_Controller/address_controller.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/Update_Controller/email_controller.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/Update_Controller/name_controller.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/Update_Controller/password_controller.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/Update_Controller/phoneupdate_controller.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/Update_Controller/userotpverifcation_controller.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';
import 'package:get/get.dart';
import 'package:new_pinput/new_pinput.dart';

RxString countryCode = '+1'.obs;

RxBool buttonIsPressed = false.obs;

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Profile_controller profile_controller = Get.put(Profile_controller());

  Updatename_controller updatename_controller =
  Get.put(Updatename_controller());


  Updatephone_controller updatephone_controller =
      Get.put(Updatephone_controller());

  Updateaddress_controller updateaddress_controller =
      Get.put(Updateaddress_controller());

  Userpasswordchnge_controller userpasswordchnge_controller =
      Get.put(Userpasswordchnge_controller());

  Useremail_controller useremail_controller = Get.put(Useremail_controller());

  Useremailotp_controller useremailotp_controller =
      Get.put(Useremailotp_controller());

  // Update_controller update_controller = Get.put(Update_controller());

  var _formKey = GlobalKey<FormState>();

  var _formKeyname = GlobalKey<FormState>();
  var _formKeyphonenumber = GlobalKey<FormState>();
  var _formKeyemailid = GlobalKey<FormState>();
  var _formKeyotp = GlobalKey<FormState>();
  var _formKeypassword = GlobalKey<FormState>();
  var _formKeyaddress = GlobalKey<FormState>();
  final hourse_Controller = TextEditingController().obs;
  final street_Controller = TextEditingController().obs;
  final area_Controller = TextEditingController().obs;
  final country_Controller = TextEditingController().obs;
  final postcode_Controller = TextEditingController().obs;
  final state_Controller = TextEditingController().obs;
  final city_Controller = TextEditingController().obs;
  final mobilenum_Controller = TextEditingController().obs;

  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    // update_controller.update_apihit();
    profile_controller.Profile_apihit();

    _formKey.currentState!.save();
    Future.delayed(Duration(seconds: 5), () {
      setState(() {});
    });
  }

  _submitname() {
    final isValid = _formKeyname.currentState!.validate();
    if (!isValid) {
      return;
    }
     updatename_controller.updatename_apihit(context);
    _formKeyname.currentState!.save();
  }


  _submitphonenumber() {
    final isValid = _formKeyphonenumber.currentState!.validate();
    if (!isValid) {
      buttonIsPressed.value = false;
      return;
    }
    updatephone_controller.update_apihit(context);
    _formKeyphonenumber.currentState!.save();
  }

  _submitemailid() {
    final isValid = _formKeyemailid.currentState!.validate();
    if (!isValid) {
      return;
    }
    print("valid success");
    useremail_controller.useremail_apihit();
    _formKeyemailid.currentState!.save();
  }

  _submitPassword() {
    final isValid = _formKeypassword.currentState!.validate();
    if (!isValid) {
      return;
    }
    userpasswordchnge_controller.Createpasschnge_apihit(context);
    //login_controller.Login_apihit();
    _formKeypassword.currentState!.save();
  }

  _submitAddress(String address) {
    // final isValid = _formKeyaddress.currentState!.validate();
    // if (!isValid) {
    //   return;
    // }\
    Get.back();

    updateaddress_controller.updateaddress_apihit(context, address);
    //login_controller.Login_apihit();
    // _formKeyaddress.currentState!.save();
  }

  void _showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents the user from dismissing the dialog by tapping outside it.
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(15.0),
              ),
              width: 100.0,
              height: 100.0,
              padding: const EdgeInsets.all(30.0),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }


  // piker
  File imgFile = File("");

  final imgPicker = ImagePicker();
  void openCamera(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }
  //open camera
  void openCameraa(abc) async {
    var imgCamera = await imgPicker.pickImage(source: abc);
    setState(() {
      imgFile = File(imgCamera!.path);
    });
    Navigator.of(context).pop();
  }




  @override
  void initState() {
    profile_controller.Profile_apihit();
    // TODO: implement initState
    super.initState();
  }

  RxBool passwordVisible = true.obs;


  // name
  void _showBottomSheetName(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true, // To make the sheet full-screen
      builder: (context) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKeyname,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Change Name",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 22),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    "Name",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  TextFormField(
                          controller: updatename_controller.nameController.value,
                          //txtphn,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter name",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              contentPadding:
                              EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                  BorderSide(color: Color(0xff9796A1))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                  BorderSide(color: Color(0xff9796A1))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                  BorderSide(color: Color(0xff9796A1)))),
                          onFieldSubmitted: (value) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.length > 12) {
                              return 'enter the valid name';
                            }
                            return null;
                          },
                        ),

                  SizedBox(height: Get.height * 0.03),
                  Obx(
                        () => buttonIsPressed.value == true
                        ? CupertinoActivityIndicator()
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyButton(
                            title: "Confirm",
                            onTap: () {
                              // buttonIsPressed.value = true;
                              _submitname();
                              Get.back();
                              _showLoading(context);
                            },
                            bgColor: Color(0xff41004C),
                            side: BorderSide(color: Color(0xff41004C)),
                            height: Get.height * 0.06,
                            width: Get.width * 0.4),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                ],
              ),
            ));
      },
    );
  }


  // phone number
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true, // To make the sheet full-screen
      builder: (context) {
        return Container(
            // height: Get.height*0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKeyphonenumber,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Change Phone Number",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    "Phone Number",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  Row(
                    children: [
                      CountryCodePicker(
                        dialogSize: Size(Get.width * 0.6, Get.height * 0.6),
                        onChanged: (_) {
                          countryCode.value = _.toString();
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'ca',
                        // favorite: ['+39', 'FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                        // dialogTextStyle: ,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: updatephone_controller
                              .phonenumberController.value,
                          //txtphn,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter phone number",
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontFamily: GoogleFonts.outfit().fontFamily,
                              ),
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 10, 20, 10),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xff9796A1))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xff9796A1))),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xff9796A1)))),
                          onFieldSubmitted: (value) {},
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty || value.length > 12) {
                              return 'enter the valid phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Obx(
                    () => buttonIsPressed.value == true
                        ? CupertinoActivityIndicator()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyButton(
                                  title: "Confirm",
                                  onTap: () {
                                    buttonIsPressed.value = true;
                                    _submitphonenumber();
                                    Get.back();
                                    _showLoading(context);
                                  },
                                  bgColor: Color(0xff41004C),
                                  side: BorderSide(color: Color(0xff41004C)),
                                  height: Get.height * 0.06,
                                  width: Get.width * 0.4),
                            ],
                          ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                ],
              ),
            ));
      },
    );
  }

  //email
  void _showBottomSheetEmail(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true, // To make the sheet full-screen
      builder: (context) {
        return Container(
            // height: Get.height*0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKeyemailid,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Update Email",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    "E-mail",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  TextFormField(
                    controller: useremail_controller.useremailController.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Enter your email",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff9796A1),
                          fontSize: 14,
                          fontFamily: GoogleFonts.outfit().fontFamily,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1)))),
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
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          title: "Cancel",
                          onTap: () {
                            Get.back();
                          },
                          bgColor: Color(0xff41004C),
                          side: BorderSide(color: Color(0xff41004C)),
                          height: Get.height * 0.06,
                          width: Get.width * 0.4),
                      MyButton(
                          title: "Send Otp",
                          onTap: () {
                            _submitemailid();
                            Get.back();
                            _showBottomSheetOtp(context);
                          },
                          bgColor: Color(0xff911FDA),
                          side: BorderSide(color: Color(0xff911FDA)),
                          height: Get.height * 0.06,
                          width: Get.width * 0.4)
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),
                ],
              ),
            ));
      },
    );
  }

  //otp
  void _showBottomSheetOtp(BuildContext context) {
    TextEditingController otpController = TextEditingController();
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true, // To make the sheet full-screen
      builder: (context) {
        final focusNode = FocusNode();
        return Container(
            // height: Get.height*0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Verification Code",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.005),
                  Center(
                    child: Text(
                      "Please enter the 4 digit code sent to",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color(0xff9796A1),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  Center(
                    child: Text(
                      useremail_controller.useremailController.value.text
                          .toString(),
                      //"userdemo@gmail.com",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Color(0xff9796A1),
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Directionality(
                          textDirection: TextDirection.ltr,
                          child: Pinput(
                            controller: otpController,
                            length: 4,
                            // controller: resetpasswordOTP_controller.pinController.value,
                            focusNode: focusNode,
                            androidSmsAutofillMethod:
                                AndroidSmsAutofillMethod.smsUserConsentApi,
                            listenForMultipleSmsOnAndroid: true,

                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'enter the first name';
                              }
                              return null;
                            },
                            hapticFeedbackType: HapticFeedbackType.lightImpact,
                            onCompleted: (pin) {
                              debugPrint('onCompleted: $pin');
                            },
                            onChanged: (value) {
                              debugPrint('onChanged: $value');
                            },
                            cursor: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 9),
                                  width: 20,
                                  height: 2,
                                  color: Color.fromRGBO(23, 171, 144, 1),
                                ),
                              ],
                            ),
                            defaultPinTheme: PinTheme(
                              width: 45,
                              height: 45,
                              textStyle: TextStyle(
                                fontSize: 22,
                                color: Color.fromRGBO(30, 60, 87, 1),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: Color.fromRGBO(23, 171, 144, 0.4)),
                              ),
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "I don't recevie a code!",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Color(0xff5B5B5E),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily)),
                        TextSpan(
                            text: " Please resend",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Color(0xff41004C),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                    decoration: TextDecoration.underline),
                            recognizer: TapGestureRecognizer()..onTap = () {})
                      ])),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyButton(
                          title: "Verify",
                          onTap: () {
                            print(useremail_controller
                                .useremailController.value.text);
                            print(otpController.text);
                            print("clicked on verify");

                            useremailotp_controller.useremailotp_apihit(
                                useremail_controller
                                    .useremailController.value.text,
                                otpController.text,
                                context);
                            // Get.back();
                            _showLoading(context);
                            // _showVerificationDialog(context);
                          },
                          bgColor: Color(0xff41004C),
                          side: BorderSide(color: Color(0xff41004C)),
                          height: Get.height * 0.06,
                          width: Get.width * 0.4),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.04),
                ],
              ),
            ));
      },
    );
  }

  //password&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
  void _showBottomSheetPassword(BuildContext context) {
    RxBool hidden_curr = true.obs;
    RxBool hidden_new = true.obs;
    RxBool hidden_newConfirm = true.obs;
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true, // To make the sheet full-screen
      builder: (context) {
        return Obx(() => Container(
            // height: Get.height*0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding: EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Form(
              key: _formKeypassword,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Change Password",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.04),
                  Text(
                    "Current Password",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  TextFormField(
                    controller: userpasswordchnge_controller
                        .currentpasswordController.value,
                    //passwordController,
                    obscureText: hidden_curr.value,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: " Enter Current Password",
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidden_curr.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xffD0D2D1),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                hidden_curr.value = !hidden_curr.value;
                              },
                            );
                          },
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1)))),
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
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    "New Password",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  TextFormField(
                    controller: userpasswordchnge_controller
                        .newpasswordController.value,
                    //passwordController,
                    obscureText: hidden_new.value,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: " Enter new Password",
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidden_new.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xffD0D2D1),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                hidden_new.value = !hidden_new.value;
                              },
                            );
                          },
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1)))),
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
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    "Confirm Password",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  TextFormField(
                    controller: userpasswordchnge_controller
                        .confirmpasswordController.value,
                    obscureText: hidden_newConfirm.value,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Confirm Password",
                        hintStyle:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 14,
                                  color: Color(0xff9796A1),
                                  fontWeight: FontWeight.w300,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            hidden_newConfirm.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xffD0D2D1),
                          ),
                          onPressed: () {
                            setState(
                              () {
                                hidden_newConfirm.value =
                                    !hidden_newConfirm.value;
                              },
                            );
                          },
                        ),
                        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1))),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xff9796A1)))),
                    onFieldSubmitted: (value) {},
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter the valid password';
                      }
                      if (userpasswordchnge_controller
                              .newpasswordController.value.text !=
                          userpasswordchnge_controller
                              .confirmpasswordController.value.text) {
                        return 'password do not match';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                  SizedBox(height: Get.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => (MyButton(
                          loading: userpasswordchnge_controller.loading.value,
                          title: "Confirm",
                          onTap: () {
                            _submitPassword();
                            Get.back();
                            _showLoading(context);
                          },
                          bgColor: Color(0xff41004C),
                          side: BorderSide(color: Color(0xff41004C)),
                          height: Get.height * 0.06,
                          width: Get.width * 0.4))),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                ],
              ),
            )));
      },
    );
  }

  //address &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
  void _showBottomSheetAddress(BuildContext context) {
    String updatedAddress = '';
    var _formKey = GlobalKey<FormState>();

    void _submit() {
      // final isValid = _formKey.currentState!.validate();
      // if (!isValid) {
      //   return;
      // }
      // _formKey.currentState!.save();
      updatedAddress = hourse_Controller.value.text +
          ',' +
          street_Controller.value.text +
          ',' +
          area_Controller.value.text +
          ',' +
          city_Controller.value.text +
          ',' +
          state_Controller.value.text +
          ',' +
          country_Controller.value.text +
          ',' +
          postcode_Controller.value.text;

      print(updatedAddress);
      // updateaddress_controller.addressController.value.text = updatedAddress;
      print('test');
      _submitAddress(updatedAddress);
    }

    String? dropdownvalue;
    // var items = [
    //   'Enter Street',
    //   'Your Activity 2',
    //   'Your Activity 3',
    //   'Your Activity 4',
    //   'Your Activity 5',
    // ];

    String? county;
    var item = [
      'INDIA',
      'USA',
      'CHINA',
      'NEPAL',
      'RUSSIA',
    ];

    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20))),
      context: context,
      isScrollControlled: true, // To make the sheet full-screen
      builder: (context) {
        return Container(
          height: Get.height * 0.65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.only(
              right: 20,
              left: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        "House/Building No",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      TextFormField(
                        controller: hourse_Controller.value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "House/Building No",
                            hintStyle: TextStyle(
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the House/Building No ';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "Street Name",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      TextFormField(
                        controller: street_Controller.value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter street name",
                            hintStyle: TextStyle(
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the street name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "Area ",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      TextFormField(
                        controller: area_Controller.value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter area",
                            hintStyle: TextStyle(
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the area';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "County",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      DropdownButtonFormField(
                          value: county,
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Color(0xff41004C)),
                          items: item.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              county = newValue!;
                              country_Controller.value.text = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null) {
                              return 'select county';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            filled: true,
                            fillColor: Colors.white,
                          )),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "Post Code",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      TextFormField(
                        controller: postcode_Controller.value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter post code",
                            hintStyle: TextStyle(
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the post code';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "Mobile Number",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      Row(
                        children: [
                          CountryCodePicker(
                            dialogSize: Size(Get.width * 0.6, Get.height * 0.6),
                            onChanged: (_) {
                              countryCode.value = _.toString();
                            },
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'ca',
                            // favorite: ['+39', 'FR'],
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                            // dialogTextStyle: ,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: mobilenum_Controller.value,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "Enter mobile number",
                                  hintStyle: TextStyle(
                                      color: Color(0xff9796A1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                      fontFamily:
                                          GoogleFonts.outfit().fontFamily),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xff9796A1))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xff9796A1))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                          color: Color(0xff9796A1)))),
                              onFieldSubmitted: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'enter mobile number';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "State",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      TextFormField(
                        controller: state_Controller.value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter state",
                            hintStyle: TextStyle(
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the state';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.02),
                      Text(
                        "city",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                      ),
                      SizedBox(height: Get.height * 0.005),
                      TextFormField(
                        controller: city_Controller.value,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "Enter city",
                            hintStyle: TextStyle(
                                color: Color(0xff9796A1),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                                fontFamily: GoogleFonts.outfit().fontFamily),
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1))),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    BorderSide(color: Color(0xff9796A1)))),
                        onFieldSubmitted: (value) {},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter the city';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: Get.height * 0.06),
                      Center(
                        child: MyButton(
                            bgColor: Color(0xff41004C),
                            title: "Submit",
                            txtStyle: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontFamily:
                                        GoogleFonts.outfit().fontFamily),
                            onTap: () {
                              _submit();
                              // Get.back();
                            },
                            height: Get.height * .07,
                            width: Get.width * 0.5),
                      ),
                      //SizedBox(height: height*0.01)
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Form(
          //   key: _formKeyaddress,
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Center(
          //         child: Text(
          //           "Change Address",
          //           style: Theme.of(context)
          //               .textTheme
          //               .displayMedium
          //               ?.copyWith(
          //                   color: Colors.black,
          //                   fontWeight: FontWeight.w600,
          //                   fontSize: 22),
          //         ),
          //       ),
          //       SizedBox(height: Get.height * 0.04),
          //       Text(
          //         "Address",
          //         style: Theme.of(context)
          //             .textTheme
          //             .titleMedium
          //             ?.copyWith(fontWeight: FontWeight.w500),
          //       ),
          //       SizedBox(
          //         height: Get.height * 0.005,
          //       ),
          //       TextFormField(
          //         controller:

          //         //txtaddress,
          //         maxLines: 4,
          //         keyboardType: TextInputType.text,
          //         decoration: InputDecoration(
          //             filled: true,
          //             fillColor: Colors.white,
          //             hintText: "Enter your address",
          //             hintStyle: TextStyle(
          //                 color: Color(0xff9796A1),
          //                 fontSize: 14,
          //                 fontWeight: FontWeight.w300,
          //                 fontFamily: GoogleFonts.outfit().fontFamily),
          //             contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          //             enabledBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(30),
          //                 borderSide: BorderSide(color: Color(0xff9796A1))),
          //             focusedBorder: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(30),
          //                 borderSide: BorderSide(color: Color(0xff9796A1))),
          //             border: OutlineInputBorder(
          //                 borderRadius: BorderRadius.circular(30),
          //                 borderSide: BorderSide(color: Color(0xff9796A1)))),
          //         onFieldSubmitted: (value) {},
          //         autovalidateMode: AutovalidateMode.onUserInteraction,
          //         validator: (value) {
          //           if (value!.isEmpty) {
          //             return 'enter the valid address';
          //           }
          //           return null;
          //         },
          //       ),
          //       SizedBox(height: Get.height * 0.03),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           MyButton(
          //               title: "Confirm",
          //               onTap: () {
          //                 _submitAddress();
          //                 Get.back();
          //                 _showLoading(context);
          //               },
          //               bgColor: Color(0xff41004C),
          //               side: BorderSide(color: Color(0xff41004C)),
          //               height: Get.height * 0.06,
          //               width: Get.width * 0.4)
          //         ],
          //       ),
          //       SizedBox(
          //         height: Get.height * 0.04,
          //       ),
          //     ],
          //   ),
          // )
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ctx = context;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      // bottomSheet: ,
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.offAll(() => TabScreen(index: 0));
          },
          child: Image.asset("assets/images/backbutton.png"),
        ),
        title: Text("Profile",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SafeArea(child: SingleChildScrollView(
          child: Obx(() {
            switch (profile_controller.rxRequestStatus.value) {
              case Status.LOADING:
                return Container(
                    height: Get.height,
                    alignment: Alignment.center,
                    child: Center(child: CircularProgressIndicator()));
              case Status.ERROR:
                if (profile_controller.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {},
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {});
                }
              case Status.COMPLETED:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.03),
                    Container(
                      height: height * 0.1,
                      width: width,
                      decoration: BoxDecoration(
                        color: Color(0xff41004C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                          leading:
                              GestureDetector(onTap: (){
                              showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Choose"),
                                          content: Row(
                                            children: [
                                              GestureDetector(
                                                child: Text("Camera"),
                                                onTap: () {
                                                  openCameraa(ImageSource.camera);
                                                },
                                              ),
                                              SizedBox(width: 80),
                                              GestureDetector(
                                                child: Text("Gallery"),
                                                onTap: () {
                                                  openCameraa(ImageSource.gallery);
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      });
                              }, child:CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 25,
                                child:
                                ClipOval(

            // radius: 25,
            // backgroundImage: AssetImage("assets/images/user.png"),
              child:
              !(imgFile.path == '') ?
              Image.file(
                imgFile, height: 100, width: 55,
                fit: BoxFit.cover,)
                  :
              Image.asset("assets/images/user.png",height: 100,width:55,fit: BoxFit.cover,),
                    ),
                                  )
                              ),
                          title: Text(
                              profile_controller
                                  .userList.value.userDetails![0].userName
                                  .toString(),
                              //username.toString(),
                              textAlign: TextAlign.start,
                              // "Farion Wick",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      fontFamily:
                                          GoogleFonts.outfit().fontFamily)),
                          subtitle: Text(
                              profile_controller
                                  .userList.value.userDetails![0].userEmail
                                  .toString(),
                              //  "userdemo@gmail.com",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                      fontSize: 11,
                                      color: Colors.white,
                                      fontFamily:
                                          GoogleFonts.inter().fontFamily)),
                          trailing: IconButton(
                              onPressed: () {
                                _showBottomSheetName(ctx);
                              },
                              icon: Icon(Icons.edit, color: Color(0xff911FDA)))),
                    ),
                    SizedBox(height: height * 0.025),
                    ListTile(
                        //horizontalTitleGap: 1,
                        leading: Image.asset("assets/images/call.png"),
                        title: Text("Phone Number",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                )),
                        subtitle: Text(
                            profile_controller.userList.value.userDetails![0]
                                    .userPhonenumber ??
                                'No address yet',
                            //txtphn.text,
                            // "9876543210",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9796A1),
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                )),
                        trailing: IconButton(
                            onPressed: () {
                              _showBottomSheet(context);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xff911FDA),
                            ))),
                    ListTile(
                        leading: Image.asset("assets/images/email.png"),
                        title: Text("Email ID",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                )),
                        subtitle: Text(
                            profile_controller
                                    .userList.value.userDetails![0].userEmail ??
                                'No email yet',
                            // "userdemo@gmail.com",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9796A1),
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                )),
                        trailing: IconButton(
                            onPressed: () {
                              _showBottomSheetEmail(ctx);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xff911FDA),
                            ))),
                    ListTile(
                      leading: Image.asset("assets/images/lock.png"),
                      title: Text("Password",
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                  )),
                      subtitle: Text(
                          // profile_controller
                          //     .userList.value.userDetails![0].userPassword.toString(),
                          "********",
                          // "Chnage Password",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff9796A1),
                                    fontFamily: GoogleFonts.outfit().fontFamily,
                                  )),
                      trailing: IconButton(
                        onPressed: () {
                          _showBottomSheetPassword(context);
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Color(0xff911FDA),
                        ),
                      ),
                    ),
                    ListTile(
                        leading: Image.asset("assets/images/locations.png"),
                        title: Text("Address",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                )),
                        subtitle: Text(
                            profile_controller.userList.value.userDetails![0]
                                    .userAddress ??
                                'No address yet',
                            // "D NO.27-33-1, Kamaraju Centre, Gudavallivari Street, Governerpet, Vijayawada-520002",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff9796A1),
                                  fontFamily: GoogleFonts.outfit().fontFamily,
                                )),
                        trailing: IconButton(
                            onPressed: () {
                              _showBottomSheetAddress(context);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Color(0xff911FDA),
                            ))),
                    SizedBox(height: height * 0.05)
                  ],
                );
            }
          }),
        )),
      ),
    );
  }


}
