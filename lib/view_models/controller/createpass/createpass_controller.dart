import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/login.dart';
import 'package:the29029restaurant/view_models/controller/reserpassword/resetpassword_controller.dart';

class Createpass_controller extends GetxController {


  final _api = AuthRepository();

  // MySharedPreferences mySharedPreferences = MySharedPreferences();

  final passwordController = TextEditingController().obs ;
  final confirmpasswordController = TextEditingController().obs ;


  RxBool loading = false.obs;


  void Createpass_apihit(){
    loading.value = true ;
    Map data = {
      'email':   varificationemail,
      'password' : passwordController.value.text,
      'confirm_password' : confirmpasswordController.value.text

    };
          print(data);
    _api.Createpassapi(data).then((value){
      loading.value = false ;

      Get.to(  ()=>LoginPage() );


      Utils.snackBar('Login', 'Login successfully');


    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('incorrect','please check email/password');   // error.toString()
    });
  }
}