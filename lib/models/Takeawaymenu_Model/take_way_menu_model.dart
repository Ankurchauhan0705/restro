class TakewayModel {
  TakewayModel({
     this.takeAwayMenu,
  });
   List<TakeAwayMenu>?takeAwayMenu;
  
  TakewayModel.fromJson(Map<String, dynamic> json){
    takeAwayMenu = List.from(json['take_away_menu']).map((e)=>TakeAwayMenu.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['take_away_menu'] = takeAwayMenu!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TakeAwayMenu {
  TakeAwayMenu({
     this.categoryImg,
     this.categoryName,
     this.categorySlug,
     this.categoryDescription,
  });
   String? categoryImg;
   String ?categoryName;
   String ?categorySlug;
   String? categoryDescription;
  
  TakeAwayMenu.fromJson(Map<String, dynamic> json){
    categoryImg = json['category_img'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    categoryDescription = json['category_description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_img'] = categoryImg;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['category_description'] = categoryDescription;
    return _data;
  }
}