import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:the29029restaurant/view/verificationcode.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';

// String? uservarificationemail;

class Useremail_controller extends GetxController {
  final _api = AuthRepository();

  final useremailController = TextEditingController().obs;

  RxBool loading = false.obs;

  void useremail_apihit() {
    print(useremailController.value.text);
    print(userid);
    loading.value = true;
    Map data = {
      'user_id': userid.value,
      'email': useremailController.value.text,
    };
    _api.Updateemailapi(data).then((value) {
      loading.value = false;

      // uservarificationemail = useremailController.value.text;

      // Utils.snackBar('send otp', 'please check email in otp');
    }).onError((error, stackTrace) {
      loading.value = false;
      // Utils.snackBar('incorrect', 'please check email'); // error.toString()
    });
  }
}
