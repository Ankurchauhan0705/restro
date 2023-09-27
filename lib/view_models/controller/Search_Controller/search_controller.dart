import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Search_Model/search_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

import '../../../view/Search_Screen/searching.dart';

class Searching_controller extends GetxController {
  final _api = AuthRepository();

  var rxRequestStatus = Status.LOADING.obs;
  final userList = SearchModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setUserList(SearchModel _value) => userList.value = _value;
  void setError(String _value) => error.value = _value;

  void searchapihit(String x) {
    print(x);
    print(
        'printinggggggggggggggggggggggggggggggggggggggg xxxxxxxxxxxxxxxxxxxxxxx');
    //  setRxRequestStatus(Status.LOADING);
    Map data = {"search_parametters": x};
    _api.Searchapi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      print(value);
      setUserList(value);
      print("successssssssssssssssssssssssssssssssssssssssssssnac");

      print("successssssssssssssssssssssssssssssssssssssssssssnac");
    }).onError((error, stackTrace) {
      print("errorrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}
