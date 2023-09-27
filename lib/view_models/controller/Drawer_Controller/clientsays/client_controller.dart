import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view/bottomnavigationbar/tab_screen.dart';
import 'package:the29029restaurant/view/drawerscreen/clientsays.dart';

RxString ipAddres = 'Loading...'.obs;
class Clientsays_controller extends GetxController {
  final _api = AuthRepository();

  final rating = TextEditingController().obs;
  final title = TextEditingController().obs;
  final  review = TextEditingController().obs;
  final name = TextEditingController().obs;
  final email = TextEditingController().obs;


  // final emailFocusNode = FocusNode().obs;
  // final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void client_apihit() {
    loading.value = true;
    Map data = {
      'method': 'site_review_api',
      'rating': rating.value.text,
      'title': title.value.text,
      'review': review.value.text,
      'name': name.value.text,
      'email': email.value.text,
      'terms': switchValue.value.toString(),
      'ip_address': ipAddres.value,
    };
    print(data);
    print(switchValue);
    _api.Clientapi(data).then((value) {
      loading.value = false;

      rating.value.clear();
      title.value.clear();
      review.value.clear();
      name.value.clear();
      email.value.clear();


      Utils.snackBar(value.clientSayReview![0].Status.toString(),
          value.clientSayReview![0].Message.toString());


      // Get.offAll(() => TabScreen(index:0));


    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('retry', error.toString());
    });
  }

  Future<void> getIpAddress() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {

          ipAddres.value = result[0].address;
          print(ipAddres.value);
          client_apihit();

      } else {
          ipAddres.value = 'Failed to retrieve IP';
          print(ipAddres.value);
          loading.value = false;
          Utils.snackBar('ip','');

      }
    } catch (e) {
        ipAddres.value = 'Error: $e';
        print(ipAddres.value);
        loading.value = false;
        Utils.snackBar('ip', 'same form field');
    }
  }

}
