import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

import 'package:the29029restaurant/res/routes/routes_name.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/login.dart';
import 'package:the29029restaurant/view_models/controller/user_preference/user_prefrence_view_model.dart';

class Signup_controller extends GetxController {


  final _api = AuthRepository();


  final usernameController = TextEditingController().obs ;
  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;


  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  void signup_apihit(){
    loading.value = true ;
    Map data = {
      'username' : usernameController.value.text ,
      'email' : emailController.value.text,
      'password' : passwordController.value.text

    };
    _api.Signupapi(data).then((value){
      loading.value = false ;

      Get.to(LoginPage());

      Utils.snackBar( 'Signup',value.message.toString()
          // 'Signup successfully'
      );


    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('already exit account',error.toString()
          // 'please check because already sign up'
      );  // error.toString()
    });
  }
}