class TableModel {
  TableModel({
     this.takeAwayMenuTabing,
  });
    List<TakeAwayMenuTabing> ?takeAwayMenuTabing;

  TableModel.fromJson(Map<String, dynamic> json){
    takeAwayMenuTabing = List.from(json['take_away_menu_tabing']).map((e)=>TakeAwayMenuTabing.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['take_away_menu_tabing'] = takeAwayMenuTabing!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TakeAwayMenuTabing {
  TakeAwayMenuTabing({
     this.categoryName,
     this.categorySlug,
  });
    String ?categoryName;
    String ?categorySlug;

  TakeAwayMenuTabing.fromJson(Map<String, dynamic> json){
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    return _data;
  }
}
