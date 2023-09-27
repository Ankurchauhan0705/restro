// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:the29029restaurant/models/Login_Model/login_model.dart';
//
//
// class UserPreference {
//
//     Future<bool> saveUser(LoginModel responseModel)async{
//       SharedPreferences sp = await SharedPreferences.getInstance();
//       sp.setString('token', responseModel.token.toString());
//      // sp.setString('message', responseModel.message.toString());
//       sp.setBool('isLogin', responseModel.isLogin! as bool);
//
//       return true ;
//     }
//
//     Future<LoginModel> getUser()async{
//       SharedPreferences sp = await SharedPreferences.getInstance();
//       String? token = sp.getString('token');
//      // String? message = sp.getString('message');
//       bool? userData = sp.getBool('user_data');
//
//       return LoginModel(
//           status : status,
//           message : message,
//           userData : userData,
//         // token: token ,
//         // isLogin: isLogin
//       ) ;
//     }
//
//     Future<bool> removeUser()async{
//       SharedPreferences sp = await SharedPreferences.getInstance();
//       sp.clear();
//       return true ;
//     }
// }