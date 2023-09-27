// import 'package:get/get.dart';
// import 'package:the29029restaurant/data/response/status.dart';
// import 'package:the29029restaurant/models/Takeawaymenu_Model/take_way_menu_model.dart';
// import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
//
//
// class Take_way_menu_controller extends GetxController {
//   final _api = AuthRepository();
//
//   final rxRequestStatus = Status.LOADING.obs;
//   final userList = TakewayModel().obs;
//   RxString error = ''.obs;
//
//   void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
//   void setUserList(TakewayModel _value) => userList.value = _value;
//   void setError(String _value) => error.value = _value;
//
//   void takewayapihit() {
//     Map data = {
//       "take_away_menu": "take_away_menu_api",
//     };
//     _api.takewayapi(data).then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//     }).onError((error, stackTrace) {
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//     });
//   }
// }
