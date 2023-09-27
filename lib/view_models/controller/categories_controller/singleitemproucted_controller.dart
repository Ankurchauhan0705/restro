import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Categories_Model/singlelitemproucta_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/itemsforstarters.dart';

class Singleitemproducted_Controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =SingleitemproductModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(SingleitemproductModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void singleitemsprouductedapihit(){
    Map data={
      'method':'single_product',
      'product_id':itemcategiorscategoryid,

    };
    _api.singleitemproductedsapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
      print("succccccccccccccccccccccccccccccccccccccccccccccc");

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print('errrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');

    });
  }

}