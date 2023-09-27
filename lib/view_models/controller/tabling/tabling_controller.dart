import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Table_Model/table_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

class tabling_controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =TableModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(TableModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void tablingapi(){
    //  setRxRequestStatus(Status.LOADING);
    Map data={
      "take_away_menu_tabing":"take_away_menu_tabing_api"
    };

    _api.tablingapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}