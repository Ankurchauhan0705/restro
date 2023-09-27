import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:the29029restaurant/view/login.dart';


class Login_controller extends GetxController {

  
  final _api = AuthRepository();
  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;


  void Login_apihit()async{
    loading.value = true ;
    Map data = {
      'username' : emailController.value.text,
      'password' : passwordController.value.text

    };

    _api.Loginapi(data).then((value){
      print('printing valueeeeeeeeeeeeeeeeeeeeeeeeeeeee');
      print(value);
      loading.value = false ;
      loginbuttonused.value=false;

      Get.to(()=> Animations());

      // Get.to(TabScreen(index:0,));

     // Utils.snackBar('Login', 'Login successfully');
      saveData(
        displayName: value.userDisplayName.toString(),
        email: value.userEmail.toString(),
        id: value.userId.toString(),
        nickname: value.userNicename.toString(),
        token: value.token.toString()

      );

    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('incorrect','please check email/password');
      loginbuttonused.value =false;

      // error.toString()
    });
  }
}



// shareperfences
Future<void> saveData({required String token,required String email,required String nickname,required String displayName,required String id,} ) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('token', token);
  prefs.setString('user_email',email);
  prefs.setString('user_nicename', nickname);
  prefs.setString('user_display_name', displayName);
  prefs.setString('user_id', id);
  prefs.setString('userPassword',loginPassword! );
  // prefs.setInt('user_id', data['user_id']);

  // similarly, save username and password if needed
  print("Successfullly stored data in sp");
}
// Function to retrieve data
Future<Map<String, dynamic>> retrieveData() async {
  final prefs = await SharedPreferences.getInstance();

  return {
    'token': prefs.getString('token'),
    'user_email': prefs.getString('user_email'),
    'user_nicename': prefs.getString('user_nicename'),
    'user_display_name': prefs.getString('user_display_name'),
    'user_id': prefs.getInt('user_id'),
    // similarly, retrieve username and password if needed
  };
}