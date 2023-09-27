class MenuPage {
  MenuPage({
    this.categoryMainMenu,
  });
   List<CategoryMainMenu> ?categoryMainMenu;
  
  MenuPage.fromJson(Map<String, dynamic> json){
    categoryMainMenu = List.from(json['category_main_menu']).map((e)=>CategoryMainMenu.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_main_menu'] = categoryMainMenu!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class CategoryMainMenu {
  CategoryMainMenu({
    this.categoryImg,
    this.categoryId,
    this.categoryName,
    this.categorySlug,
    this.categoryDescription,
  });
   String? categoryImg;
   int? categoryId;
   String ?categoryName;
   String ?categorySlug;
   String? categoryDescription;
  
  CategoryMainMenu.fromJson(Map<String, dynamic> json){
    categoryImg = json['category_img'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    categoryDescription = json['category_description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_img'] = categoryImg;
    _data['category_id'] = categoryId;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['category_description'] = categoryDescription;
    return _data;
  }
}