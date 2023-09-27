import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Drawer_Models/ClientSays_Model/clients_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';


class Clients_controller extends GetxController {

  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =ClientsModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(ClientsModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void clientsspihit(){
    //  setRxRequestStatus(Status.LOADING);
    Map data={
      "method":"site_review_get"
    };
    _api.Clientsapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}