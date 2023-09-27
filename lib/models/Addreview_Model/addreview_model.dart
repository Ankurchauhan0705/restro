class AddreviewModel {
  AddreviewModel({
     this.addReviewDetais,
  });
   List<AddReviewDetais> ?addReviewDetais;

  AddreviewModel.fromJson(Map<String, dynamic> json){
    addReviewDetais = List.from(json['add_review_detais']).map((e)=>AddReviewDetais.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['add_review_detais'] = addReviewDetais!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class AddReviewDetais {
  AddReviewDetais({
     this.Code,
     this.Status,
     this.Message,
  });
   String ?Code;
   String ?Status;
   String ?Message;

  AddReviewDetais.fromJson(Map<String, dynamic> json){
    Code = json['Code'];
    Status = json['Status'];
    Message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Code'] = Code;
    _data['Status'] = Status;
    _data['Message'] = Message;
    return _data;
  }
}