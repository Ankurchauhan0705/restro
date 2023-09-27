// import 'package:get/get.dart';
// import 'package:the29029restaurant/data/response/status.dart';
// import 'package:the29029restaurant/models/Categories_Model/buy_model.dart';
// import 'package:the29029restaurant/models/Categories_Model/subcategories_model.dart';
// import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';
// import 'package:the29029restaurant/view/bottombarscreen/onlineorder/categories.dart';
//
// class Singlebuynow_Controller extends GetxController {
//
//
//   final _api = AuthRepository();
//
//   final rxRequestStatus = Status.LOADING.obs ;
//   final userList =BuyModel().obs ;
//   RxString error = ''.obs;
//
//   void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
//   void setUserList(BuyModel _value) => userList.value = _value ;
//   void setError(String _value) => error.value = _value ;
//
//
//   void singlebuynowapihit(){
//     Map data={
//       'method':'single_product_buy_now',
//       'wfs_service_type':'Delivery',
//       'wfs_service_date':'2023-08-15',
//       'wfs_service_time':'12:00PM',
//       'product_id':'7313',
//       'quantity':'3',
//       'first_name':'Test',
//       'last_name':'NBT',
//       'email':'test123@gmail.com',
//       'phone':'0123456789',
//       'address_1':'nbt',
//       'address_2':'test',
//       'city':'Jaipur',
//       'state':'Rajasthan',
//       'postcode':'302038',
//       'country':'india'
//     };
//     _api.singleproductbuyapi(data).then((value){
//       setRxRequestStatus(Status.COMPLETED);
//       setUserList(value);
//       print(value);
//
//     }).onError((error, stackTrace){
//       setError(error.toString());
//       setRxRequestStatus(Status.ERROR);
//
//     });
//   }
//
// }