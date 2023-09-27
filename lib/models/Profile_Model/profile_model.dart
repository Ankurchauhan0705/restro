import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../view_models/controller/Profile_Controller/profile_controller.dart';

RxString userNameFromProfileApihome = ''.obs;
RxString userAddressFromProfileApihome = ''.obs;
RxString userPhoneFromProfileApihome = ''.obs;

class ProfileModel {
  ProfileModel({
    this.userDetails,
  });
  List<UserDetails>? userDetails;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userDetails = List.from(json['user_details'])
        .map((e) => UserDetails.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_details'] = userDetails!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class UserDetails {
  UserDetails({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPassword,
    this.userPhonenumber,
    this.userAddress,
  });
  int? userId;
  String? userName;
  String? userEmail;
  String? userPassword;
  String? userPhonenumber;
  String? userAddress;

  UserDetails.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPassword = json['user_password'];
    userPhonenumber = json['user_phonenumber'];
    userAddress = json['user_address'];
    userid.value = userId.toString();
    userNameFromProfileApihome.value = userName.toString();
    userAddressFromProfileApihome.value = userAddress.toString();
    userPhoneFromProfileApihome.value = userPhonenumber.toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['user_name'] = userName;
    _data['user_email'] = userEmail;
    _data['user_password'] = userPassword;
    _data['user_phonenumber'] = userPhonenumber;
    _data['user_address'] = userAddress;
    return _data;
  }
}
