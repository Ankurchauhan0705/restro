class ContactdetailsModel {
  ContactdetailsModel({
     this.contactDetails,
  });
   List<ContactDetails> ?contactDetails;

  ContactdetailsModel.fromJson(Map<String, dynamic> json){
    contactDetails = List.from(json['contact_details']).map((e)=>ContactDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['contact_details'] = contactDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ContactDetails {
  ContactDetails({
     this.Lable,
     this.name,
  });
  String ?Lable;
  String ?name;

  ContactDetails.fromJson(Map<String, dynamic> json){
    Lable = json['Lable'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Lable'] = Lable;
    _data['name'] = name;
    return _data;
  }
}