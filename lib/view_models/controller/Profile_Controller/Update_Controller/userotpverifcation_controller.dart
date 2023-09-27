import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/animation_screen.dart';
import 'package:the29029restaurant/view/bottombarscreen/profile/profile.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';
import 'package:http/http.dart' as http;
import 'package:the29029restaurant/widgets/my_button.dart';

import '../../../../view/login.dart';

class Useremailotp_controller extends GetxController {
  final _api = AuthRepository();

  final otpController = TextEditingController().obs;

  RxBool loading = false.obs;

  void useremailotp_apihit(String email, String otp, BuildContext ctx) {
    // print(useremailController.value.text);
    print(userid);
    loading.value = true;
    Map data = {
      'email': email,
      'otp': otp,
      'user_id': userid.value,
    };
    _api.Updateemailotpapi(data).then((value) {
      loading.value = false;

      // uservarificationemail = useremailController.value.text;
      // Get.to(TabScreen(index:0,));
      // Get.back();
      print("otp verified");

      // Get.to(VerificationCode(emailText: useremailController.value.text));
      updateUserEmail(userid.value, email, ctx);
    }).onError((error, stackTrace) {
      print("errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      loading.value = false;
      Utils.snackBar('incorrect', 'please check email'); // error.toString()
    });
  }
}

void updateUserEmail(String id, String mail, BuildContext ctx) async {
  final url =
      'https://www.the29029restaurant.com/wp-json/myplugin/v1/user_email_update';
  final headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  final body = {
    'method': 'user_email_update',
    'userid': id,
    'useremail': mail,
  };

  final response = await http.post(
    Uri.parse(url),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('user_email',mail);

    userEmailsp = mail;
    print("successsss********************************************");
    print('User email updated successfully');
    print('Response body: ${response.body}');
    Utils.snackBar('send otp', 'please check email in otp');
    // Get.back();
    setData(userEmailsp.toString());
    _showVerificationDialog(ctx);
  } else {
    print(
        "faild&&&&&&&&&&&&&&&&&&********************************************");

    print('Failed to update user email');
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

void _showVerificationDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,

    context: context,
    // barrierDismissible: false, // Prevent closing by tapping outside
    builder: (context) {
      return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.white,
          content: Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Image.asset("assets/applogo/Vector.png"),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text('Success',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text(
                  "You have updated successfully",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Color(0xff777777),
                      fontWeight: FontWeight.w300,
                      fontSize: 14),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                MyButton(
                    title: "Back to home",
                    bgColor: Color(0xff41004C),
                    onTap: () {
                      Get.offAll(() => TabScreen(index: 4));
                    },
                    height: Get.height * 0.06,
                    width: Get.width * 0.4)
              ],
            ),
          ));
    },
  );
}

setData(String email) async {
  final prefs = await SharedPreferences.getInstance();

  prefs.setString('user_email', email);
}
