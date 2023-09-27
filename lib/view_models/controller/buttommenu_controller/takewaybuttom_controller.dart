import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Menulisting_Model/menulisting_model.dart';
import 'package:the29029restaurant/models/Takeawaymenu_Model/take_way_menu_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/menu.dart';

class buttom_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = MenulistingModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(MenulistingModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void buttoknapihit() {
    Map data = {
      'menu_listing': 'menu_listing_api',
      'category_id': menucategoryid
    };
    _api.Takewaysbuttomapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
