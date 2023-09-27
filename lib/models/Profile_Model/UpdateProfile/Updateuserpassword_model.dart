import 'package:get/get.dart';

RxString statush=''.obs;
RxString messageh=''.obs;
class Updateuserpassword {
  Updateuserpassword({
     this.status,
     this.message,
  });
    String ?status;
    String ?message;

  Updateuserpassword.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];

    statush.value=status.toString();
    messageh.value=message.toString();

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}