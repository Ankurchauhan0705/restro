import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/home/user_list_model.dart';


import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
class Home_controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =HomeModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(HomeModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void homeapihit(){
    //  setRxRequestStatus(Status.LOADING);
Map data={
"homeapi":"homepageapi"
};
    _api.home_api(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}