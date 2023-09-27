import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Starters_Model/starters_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
class Starters_controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList = StartersModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(StartersModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void Startersapihit(){
    Map data={
      "party_menu_single":"party_menu_single_api",
      "product_slug":"main-course-party-menu-a-party-menus"
    };
    _api.Startersapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}