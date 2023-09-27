import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Drawer_Models/ContactUs_Model/contactdetals_model.dart';
import 'package:the29029restaurant/models/Drawer_Models/FollowUS_Model/followus_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';


class Contactdeatils_controller extends GetxController {

  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =ContactdetailsModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(ContactdetailsModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void contactdeatilsapihit(){
    Map data={
      "contact_method":"contact_details_api"
    };
    _api.Contactdetailsapi(data).then((value){
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