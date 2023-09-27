import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/res/routes/routes_name.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view/login.dart';
import 'package:the29029restaurant/view_models/controller/user_preference/user_prefrence_view_model.dart';

class Contactus_controller extends GetxController {


  final _api = AuthRepository();

  final firstname = TextEditingController().obs;
  final lastname = TextEditingController().obs;
  final email = TextEditingController().obs;
  final phonenumber = TextEditingController().obs;
  final message = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
 final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  void contactus_apihit(){
    loading.value = true ;
    Map data = {
      'contact_page': 'contact_page_api',
      'first_name' : firstname.value.text ,
      'last_name' : lastname.value.text,
      'email' : email.value.text,
      'phone_number':phonenumber.value.text,
      'message':message.value.text

    };
    //print(data);
    _api.Contactususapi(data).then((value){
      loading.value = false ;
      firstname.value.clear();
      lastname.value.clear();
      email.value.clear();
      phonenumber.value.clear();
      message.value.clear();


      Utils.snackBar(value.contactFormResponse![0].Status.toString(),
          value.contactFormResponse![0].Message.toString());


      Get.offAll(() => TabScreen(index:0));



    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}