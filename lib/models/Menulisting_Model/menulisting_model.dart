class MenulistingModel {
  MenulistingModel({
     this.takeAwayMenu,
  });
    List<TakeAwayMenu> ?takeAwayMenu;

  MenulistingModel.fromJson(Map<String, dynamic> json){
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
     this.categoryChildId,
     this.categoryChildMenu,
     this.categoryChildSlug,
  });
    int ?categoryChildId;
    String ?categoryChildMenu;
    String ?categoryChildSlug;

  TakeAwayMenu.fromJson(Map<String, dynamic> json){
    categoryChildId = json['category_child_id'];
    categoryChildMenu = json['category_child_menu'];
    categoryChildSlug = json['category_child_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_child_id'] = categoryChildId;
    _data['category_child_menu'] = categoryChildMenu;
    _data['category_child_slug'] = categoryChildSlug;
    return _data;
  }
}