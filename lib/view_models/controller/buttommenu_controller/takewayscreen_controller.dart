import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Menulisting_Model/listingbuttondata_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

import '../../../view/bottombarscreen/menu/takeawaymenus/takeawaymenus.dart';
// import 'package:the29029restaurant/view/bottombarscreen/menu/restaurantmenu/takeawaymenus.dart';
RxBool bootmscreenupdate=false.obs;
class buttomscreen_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = ListingsbuttomModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(ListingsbuttomModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void buttonscreenapihit( ) {
    print('printing button');
    print(Buttomonpressslug);
    Map data = {
      'method': 'restaurant_menu_filter',
      'category_slug': Buttomonpressslug==null?"starters-main-menu-take-away-menus":Buttomonpressslug
    };
    _api.takewaysscreenapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      bootmscreenupdate.value=true;
      setUserList(value);
      print(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      print(error);
      setRxRequestStatus(Status.ERROR);
    });
  }
}
