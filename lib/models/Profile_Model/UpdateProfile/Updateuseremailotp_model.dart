class Updateuseremailotp {
  Updateuseremailotp({
     this.status,
     this.message,
  });
    String ?status;
    String ?message;

  Updateuseremailotp.fromJson(Map<String, dynamic> json){
    print('test 1');
    status = json['status'];
    message = json['message'];
    print('test 2');


  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}