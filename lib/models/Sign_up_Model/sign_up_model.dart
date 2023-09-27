class SignUpModel {
  SignUpModel({
     this.code,
     this.message,
  });
   String ?code;
  String ?message;

  SignUpModel.fromJson(Map<String, dynamic> json){
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['message'] = message;
    return _data;
  }
}