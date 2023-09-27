import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/menu_page_mpdel.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

class Menu_Controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = MenuPage().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(MenuPage _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void menuapihit() {
    //  setRxRequestStatus(Status.LOADING);
    Map data = {
      "menu_bar": "menu_bar_api",
    };
    _api.menueapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
