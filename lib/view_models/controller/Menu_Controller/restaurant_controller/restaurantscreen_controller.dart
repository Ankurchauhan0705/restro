import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Menulisting_Model/menulisting_model.dart';
import 'package:the29029restaurant/models/Takeawaymenu_Model/take_way_menu_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/view/bottombarscreen/menu/menu.dart';

import '../../../../models/Menu_Model/restarantmenu_model/restaurantscreen_model.dart';
import '../../../../view/bottombarscreen/menu/restaurantmenu1/bottomscreenrestarurant.dart';
import '../../../../view/bottombarscreen/menu/restaurantmenu1/buttonscreen.dart';

class restaurant_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = ResturantbottonScreenModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(ResturantbottonScreenModel _value) =>
      userList.value = _value;
  void setError(String _value) => error.value = _value;

  void buttonrestaurantapihit({int? idx = 0}) {
    String slug = 'main-menu-restaurant-menu';
    if (idx == 2) {
      bottonrestaurantproductslug = 'side-dishes-restaurant-menu';
    }
    if (idx == 3) {
      bottonrestaurantproductslug = 'variety-foods-restaurant-menu';
    }
    // if (idx == 0) {
    //   bottonrestaurantproductslug = 'main-menu-restaurant-menu';
    // }

    Map data = {
      'method': 'restaurant_menu_filter',
      'category_slug': bottonrestaurantproductslug == null?slug:bottonrestaurantproductslug
    };
    _api.resturantbootoncreenapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      bootmresaturantscreenupdate.value = true;
      tabButtonPressed.value = false;
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
