import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/MainCourse_Model/maincourse.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

class maincourse_controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =MaincourseModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(MaincourseModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void maincourseapi(){
    //  setRxRequestStatus(Status.LOADING);
    Map data={
      "take_away_menu_filter":"take_away_menu_filter_api"
    };

    _api.maincourseapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}