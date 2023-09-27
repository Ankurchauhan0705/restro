import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';
import 'package:the29029restaurant/widgets/my_button.dart';

import '../../../../view/bottombarscreen/profile/profile.dart';

class Updatephone_controller extends GetxController {
  final _api = AuthRepository();

  final phonenumberController = TextEditingController().obs;

  RxBool loading = false.obs;

  void update_apihit(BuildContext context) {
    print('update phone');
    print(countryCode.value + phonenumberController.value.text);
    // loginemail = emailController.value.text;
    loading.value = true;
    print(userid);
    Map data = {
      'user_id': userid.value,
      'userphonenumber': countryCode.value + phonenumberController.value.text
    };
    print(data);
    _api.Updatephoneapi(data).then((value) {
      loading.value = false;

      Get.back();

      Utils.snackBar('Success', 'Phone number updated successfully');
      _showVerificationDialog(context);
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Retry', 'Try Again'); // error.toString()
    });
    buttonIsPressed.value = false;
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
