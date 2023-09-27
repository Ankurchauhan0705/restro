import 'package:get/get.dart';
import 'package:the29029restaurant/data/response/status.dart';
import 'package:the29029restaurant/models/Drawer_Models/PhotoGallery_Model/photogallery_model.dart';
import 'package:the29029restaurant/repository/Auth_Reposetory/auth_reposetory.dart';


class PhotoGallery_controller extends GetxController {

  final _api = AuthRepository();

  final rxRequestStatus = Status.LOADING.obs ;
  final userList =PhotoGalleryModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(PhotoGalleryModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void photogalleryapihit(){
    //  setRxRequestStatus(Status.LOADING);
    Map data={
      "photos_gallery":"photos_gallery_api"
    };
    _api.Photogalleryapi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");
      setRxRequestStatus(Status.ERROR);

    });
  }




}