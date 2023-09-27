import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Drawer_Models/AboutUS_Model/aboutus_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';


class AboutUS_controller extends GetxController {

  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =AboutusModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(AboutusModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void aboutusapihit(){
    Map data={
      'method':'aboutusapi'
    };
    _api.Aboutusapi(data).then((value){
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