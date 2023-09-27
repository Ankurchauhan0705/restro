import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import '../../../../models/Drawer_Models/MyOrder/orderdetailsmodel.dart';
import '../../../../view/drawerscreen/myorder.dart';


class Orderdetails_controller extends GetxController {
  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = OrderDetailsmodel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(OrderDetailsmodel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void orderdetailsmodelpihit() {
    Map data =
    {
      "order_id": OrderId.toString()         //"49303"
    };
    _api.Orderdetailsapi(data).then((value) {
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
