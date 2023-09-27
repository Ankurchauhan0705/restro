class Updateuseremail {
  Updateuseremail({
     this.updateMessage,
  });
    List<UpdateMessage> ?updateMessage;

  Updateuseremail.fromJson(Map<String, dynamic> json){
    updateMessage = List.from(json['update_message']).map((e)=>UpdateMessage.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['update_message'] = updateMessage!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class UpdateMessage {
  UpdateMessage({
     this.status,
     this.userId,
  });
    String ?status;
    String ?userId;

  UpdateMessage.fromJson(Map<String, dynamic> json){
    status = json['status'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['user_id'] = userId;
    return _data;
  }
}