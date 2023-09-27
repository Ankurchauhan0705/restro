import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/utils/utils.dart';
import 'package:the29029restaurant/view_models/controller/Profile_Controller/profile_controller.dart';

class Bookatable_controller extends GetxController {


  final _api = AuthRepository();

  final fullnameController = TextEditingController().obs ;
  final emailController = TextEditingController().obs ;
  final phonenumberController = TextEditingController().obs ;
  final messageController = TextEditingController().obs ;

  final dateController=TextEditingController().obs;
  final timeController=TextEditingController().obs;
  final peopleController=TextEditingController().obs;


  RxBool loading = false.obs;


  void bookatable_apihit() async{

    await getIpAddress();

    loading.value = true ;
    Map data = {
      'booking_table_method':'booking_table_api',
      'name' : fullnameController.value.text,
      'email' : emailController.value.text,
      'phone_number' : phonenumberController.value.text,
      'message' : messageController.value.text,
      'booking_table_date': dateController.value.text,                  //'2023-07-15',
      'booking_table_time':timeController.value.text,                     // '21:30',
      'booking_party_people' :peopleController.value.text,                // '2',
      'REMOTE_ADDR' : ipAddress.toString(),
      'user_id': userid.value.toString()

    };
      print("dataaaa***********************"+'$data');
      
      // var reasponse = http.post(url)
    _api.Bookatableapiusapi(data).then((value){
      loading.value = false ;
      print(value);
      Utils.snackBar('Successful', 'Book the Table');

    }).onError((error, stackTrace){
      loading.value = false ;
      Utils.snackBar('try again','retry book the table');  // error.toString()
    });
  }
  String?ipAddress;

  Future<void> getIpAddress() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          ipAddress = result[0].address;
          print(ipAddress);
      } else {
          ipAddress = 'Failed to retrieve IP';
          print(ipAddress);
      }
    } catch (e) {
        ipAddress = 'Error: $e';
        print(ipAddress);
    }
  }
}