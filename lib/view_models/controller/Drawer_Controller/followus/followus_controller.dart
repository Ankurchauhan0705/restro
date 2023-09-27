import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Drawer_Models/FollowUS_Model/followus_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';


class FollowUS_controller extends GetxController {

  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =FollowUSModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(FollowUSModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void follwusapihit(){
    Map data={
      "follow_us":"follow_us_api"
    };
    _api.Followusapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");
      setRxRequestStatus(Status.ERROR);
    });
  }




}