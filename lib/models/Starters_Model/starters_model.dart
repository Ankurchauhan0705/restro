class StartersModel {
  StartersModel({
     this.partyMainMenuDetails,
  });
  List<PartyMainMenuDetails> ?partyMainMenuDetails;

  StartersModel.fromJson(Map<String, dynamic> json){
    partyMainMenuDetails = List.from(json['party_main_menu_details']).map((e)=>PartyMainMenuDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['party_main_menu_details'] = partyMainMenuDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PartyMainMenuDetails {
  PartyMainMenuDetails({
    this.menuTitle,
    this.menuDiscription,
  });
   String ?menuTitle;
   String ?menuDiscription;

  PartyMainMenuDetails.fromJson(Map<String, dynamic> json){
    menuTitle = json['menu_title'];
    menuDiscription = json['menu_discription'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['menu_title'] = menuTitle;
    _data['menu_discription'] = menuDiscription;
    return _data;
  }
}