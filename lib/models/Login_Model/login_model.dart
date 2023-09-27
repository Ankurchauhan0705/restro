// class LoginModel {
//   LoginModel({
//     this.status,
//     this.message,
//     this.userData,
//   });
//    String ?status;
//    String ?message;
//    UserData ?userData;
//
//   LoginModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     userData = UserData.fromJson(json['user_data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['user_data'] = userData!.toJson();
//     return _data;
//   }
// }
//
// class UserData {
//   UserData({
//     this.ID,
//     this.Email,
//     this.Username,
//   });
//    int ?ID;
//    String ?Email;
//    String ?Username;
//
//   UserData.fromJson(Map<String, dynamic> json){
//     ID = json['ID'];
//     Email = json['Email'];
//     Username = json['Username'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['ID'] = ID;
//     _data['Email'] = Email;
//     _data['Username'] = Username;
//     return _data;
//   }
// }

import '../../view/login.dart';

// class LoginModel {
//   LoginModel({
//     required this.token,
//     required this.userEmail,
//     required this.userNicename,
//     required this.userDisplayName,
//   });
//   late final String token;
//   late final String userEmail;
//   late final String userNicename;
//   late final String userDisplayName;
//
//   LoginModel.fromJson(Map<String, dynamic> json){
//     token = json['token'];
//     userEmail = json['user_email'];
//     userNicename = json['user_nicename'];
//     userDisplayName = json['user_display_name'];
//     username=userNicename;
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['token'] = token;
//     _data['user_email'] = userEmail;
//     _data['user_nicename'] = userNicename;
//     _data['user_display_name'] = userDisplayName;
//     return _data;
//   }
// }

class LoginModel {
  LoginModel({
    this.token,
    this.userEmail,
    this.userNicename,
    this.userDisplayName,
    this.userId,
  });
  String? token;
  String? userEmail;
  String? userNicename;
  String? userDisplayName;
  dynamic? userId;

  LoginModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userEmail = json['user_email'];
    userNicename = json['user_nicename'];
    userDisplayName = json['user_display_name'];
    userId = json['user_id'];
    username = userDisplayName;
    atloginuserid = userId.toString();
    print('success');
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['user_email'] = userEmail;
    _data['user_nicename'] = userNicename;
    _data['user_display_name'] = userDisplayName;
    _data['user_id'] = userId;

    return _data;
  }
}
