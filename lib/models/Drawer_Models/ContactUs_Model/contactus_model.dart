class ContactUsModel {
  ContactUsModel({
    this.contactFormResponse,
  });
  List<ContactFormResponse> ?contactFormResponse;

  ContactUsModel.fromJson(Map<String, dynamic> json){
    contactFormResponse = List.from(json['contact_form_response']).map((e)=>ContactFormResponse.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contact_form_response'] = contactFormResponse!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ContactFormResponse {
  ContactFormResponse({
    this.Code,
    this.Status,
    this.Message,
  });
   String ?Code;
   String ?Status;
   String ?Message;

  ContactFormResponse.fromJson(Map<String, dynamic> json){
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