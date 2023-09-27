import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Categories_Model/order_buy.dart';
import 'package:the29029restaurant/models/Categories_Model/subcategories_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories.dart';

class Order_Controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =OrderModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(OrderModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void subcategoriespihit(){
    Map data={
      'payment_method':'bacs',
      'payment_method_title':'Direct Bank Transfer',
      'set_paid':'true',
      //billing
      'first_name':'John',
      'last_name':'Doe',
      'address_1':'969 Market',
      'address_2':'',
      'city':'San Francisco',
      'state':'CA',
      'postcode':'94103',
      'country' :'US',
      'email':'john.doe@example.com',
      'phone':'(555) 555-5555',
      //shiping
      'first_name':'John',
      'last_name':'Doe',
      'address_1':'969 Market',
      'address_2':'',
      'city':'San Francisco',
      'state':'CA',
      'postcode':'94103',
      'country':'US',
      //array in 

      '':'',
      '':'',
    };
    _api.orderapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

}