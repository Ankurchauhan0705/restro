// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
// import 'package:the29029restaurant/res/routes/routes_name.dart';
// import 'package:the29029restaurant/utils/utils.dart';
// import 'package:the29029restaurant/view/bottombarscreen/profile/profile.dart';
// import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
// import 'package:the29029restaurant/view/login.dart';
// import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';
// import 'package:the29029restaurant/view_models/controller/user_preference/user_prefrence_view_model.dart';
//
// class Update_controller extends GetxController {
//
//
//   final _api = AuthRepository();
//
//   final phonenumberController = TextEditingController().obs ;
//   final emailController = TextEditingController().obs ;
//   final passwordController = TextEditingController().obs ;
//   final addressController = TextEditingController().obs ;
//
//
//
//   RxBool loading = false.obs;
//
//
//   void update_apihit(){
//     loginemail = emailController.value.text;
//     loading.value = true ;
//     Map data = {
//       'user_profile_update' : 'user_profile_update_api',
//       'userid' : userid.value,
//       'username' : 'Testnbt123',
//       'userphonenumber': phonenumberController.value.text,
//       'useremail': emailController.value.text,
//       'userpassword':passwordController.value.text,
//       'useraddress': addressController.value.text
//
//
//     };
//     print(data);
//     _api.Updateapi(data).then((value){
//       loading.value = false ;
//       Get.to(TabScreen(index:3));
//
//
//       //Get.to(LoginPage());
//
//       Utils.snackBar('successfully', 'Update profile');
//
//
//     }).onError((error, stackTrace){
//       loading.value = false ;
//       Utils.snackBar('retry','try again update profile');  // error.toString()
//     });
//   }
// }