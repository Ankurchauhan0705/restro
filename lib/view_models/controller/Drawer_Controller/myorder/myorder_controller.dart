import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import '../../../../models/Drawer_Models/MyOrder/myordermodel.dart';
import '../../Profile_Controller/profile_controller.dart';

class Myorder_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = myordermodel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(myordermodel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void myorderapihit() {
    Map data =
    {
      "user_id": userid.value.toString()
    };
    _api.Myorderapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      print("error");
      setRxRequestStatus(Status.ERROR);
    });
  }
}
