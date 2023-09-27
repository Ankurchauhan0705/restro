import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Menulisting_Model/menulisting_model.dart';
import 'package:the29029restaurant/models/Takeawaymenu_Model/take_way_menu_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/menu.dart';

import '../../../models/Menu_Model/restarantmenu_model/restaurant_model.dart';

class buttomrestaurant_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = ButtonmenuModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(ButtonmenuModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void buttonrestaurantapihit() {
    Map data = {
      'menu_listing': 'menu_listing_api',
      'category_id': menucategoryid
    };
    _api.restaurantmenuapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
