class PartyMenuModel {
  PartyMenuModel({
     this.partyMenu,
  });
    List<PartyMenu> ?partyMenu;

  PartyMenuModel.fromJson(Map<String, dynamic> json){
    partyMenu = List.from(json['party_menu']).map((e)=>PartyMenu.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['party_menu'] = partyMenu!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class PartyMenu {
  PartyMenu({
     this.categoryName,
     this.categorySlug,
     this.categoryMainMenuChild,
  });
    String ?categoryName;
    String ?categorySlug;
    List<CategoryMainMenuChild> ?categoryMainMenuChild;

  PartyMenu.fromJson(Map<String, dynamic> json){
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    categoryMainMenuChild = List.from(json['category_main_menu_child']).map((e)=>CategoryMainMenuChild.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['category_main_menu_child'] = categoryMainMenuChild!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CategoryMainMenuChild {
  CategoryMainMenuChild({
     this.categoryChildMenu,
     this.categoryChildSlug,
  });
    String ?categoryChildMenu;
    String ?categoryChildSlug;

  CategoryMainMenuChild.fromJson(Map<String, dynamic> json){
    categoryChildMenu = json['category_child_menu'];
    categoryChildSlug = json['category_child_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_child_menu'] = categoryChildMenu;
    _data['category_child_slug'] = categoryChildSlug;
    return _data;
  }
}