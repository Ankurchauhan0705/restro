class ClientModel {
  ClientModel({
     this.clientSayReview,
  });
    List<ClientSayReview> ?clientSayReview;

  ClientModel.fromJson(Map<String, dynamic> json){
    clientSayReview = List.from(json['client_say_review']).map((e)=>ClientSayReview.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['client_say_review'] = clientSayReview!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ClientSayReview {
  ClientSayReview({
     this.Code,
     this.OrderID,
     this.Status,
     this.Message,
  });
    String ?Code;
    int ?OrderID;
    String ?Status;
    String ?Message;

  ClientSayReview.fromJson(Map<String, dynamic> json){
    Code = json['Code'];
    OrderID = json['OrderID'];
    Status = json['Status'];
    Message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Code'] = Code;
    _data['OrderID'] = OrderID;
    _data['Status'] = Status;
    _data['Message'] = Message;
    return _data;
  }
}