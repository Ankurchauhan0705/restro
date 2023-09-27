import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Categories_Model/categories_model.dart';


import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';

RxBool categpryDone = false.obs;
class Categories_Controller extends GetxController {


  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =CategoriesModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(CategoriesModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void categoriespihit(){
    Map data={
      "method":"product_category_api",
    };
    _api.Categoriesapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      // print(value);
      print("*****************************************************");
      print(userList.value);

    })
        .onError((error, stackTrace){
      setError(error.toString());
      
      print("error");
      setRxRequestStatus(Status.ERROR);

    });
  }

}