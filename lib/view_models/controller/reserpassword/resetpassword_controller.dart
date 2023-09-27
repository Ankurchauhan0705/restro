import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

import 'package:the29029restaurant/utils/utils.dart';

import 'package:the29029restaurant/view/login.dart';
import 'package:the29029restaurant/view/verificationcode.dart';
import 'package:the29029restaurant/view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'package:the29029restaurant/widgets/shared_prif.dart';

String? varificationemail;

class Resetpassword_controller extends GetxController {
  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final emailController = TextEditingController().obs;

  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxString statusOfApi = ''.obs;

  void Resetpassword_apihit() async {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
    };
    await _api.Resetpasswordapi(data).then((value) {
      statusOfApi.value = value.status.toString();

      loading.value = false;

      varificationemail = emailController.value.text;
      // Get.to(TabScreen(index:0,));
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('incorrect', 'please check email');
      return; // error.toString()
    });

    if (statusOfApi.value == '200') {
      Utils.snackBar('send otp', 'please check otp in email');

      Get.to(VerificationCode(emailText: emailController.value.text));
    } else {
      loading.value = false;

      Utils.snackBar(statusOfApi.value, 'please check email');
    }
  }
}
