import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import '../../../models/Bookatable_Model/upcomingmodel.dart';
import '../Profile_Controller/profile_controller.dart';

class Past_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UpcomingModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(UpcomingModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  RxBool loading = false.obs;

  void Past_apihit() {
    Map data = {
      'user_id': userid.value.toString(),     //'1'
      'history_type': 'past'
    };

    _api.Upcomingapiusapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
