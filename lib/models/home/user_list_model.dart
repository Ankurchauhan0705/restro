// class PartyMenuModel {
//   PartyMenuModel({
//     this.partyMenu,
//   });
//   List<PartyMenu>? partyMenu;
//
//   PartyMenuModel.fromJson(Map<String, dynamic> json){
//     partyMenu = List.from(json['party_menu']).map((e)=>PartyMenu.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['party_menu'] = partyMenu!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class PartyMenu {
//   PartyMenu({
//     this.categoryName,
//     this.categorySlug,
//     this.categoryMainMenuChild,
//   });
//   String? categoryName;
//   String ?categorySlug;
//   List<CategoryMainMenuChild>?categoryMainMenuChild;
//
//   PartyMenu.fromJson(Map<String, dynamic> json){
//     categoryName = json['category_name'];
//     categorySlug = json['category_slug'];
//     categoryMainMenuChild = List.from(json['category_main_menu_child']).map((e)=>CategoryMainMenuChild.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_name'] = categoryName;
//     _data['category_slug'] = categorySlug;
//     _data['category_main_menu_child'] = categoryMainMenuChild!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class CategoryMainMenuChild {
//   CategoryMainMenuChild({
//     this.categoryChildMenu,
//     this.categoryChildSlug,
//   });
//   String? categoryChildMenu;
//   String? categoryChildSlug;
//
//   CategoryMainMenuChild.fromJson(Map<String, dynamic> json){
//     categoryChildMenu = json['category_child_menu'];
//     categoryChildSlug = json['category_child_slug'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_child_menu'] = categoryChildMenu;
//     _data['category_child_slug'] = categoryChildSlug;
//     return _data;
//   }
// }



class HomeModel{
  HomeModel({
    this.bannerSection,
    this.restaurantMainMenu,
    this.categoryMainMenu,
  });
  List<BannerSection> ?bannerSection;
  List<RestaurantMainMenu> ?restaurantMainMenu;
  List<CategoryMainMenu> ?categoryMainMenu;

  HomeModel.fromJson(Map<String, dynamic> json){
    bannerSection = List.from(json['banner_section']).map((e)=>BannerSection.fromJson(e)).toList();
    restaurantMainMenu = List.from(json['restaurant_main_menu']).map((e)=>RestaurantMainMenu.fromJson(e)).toList();
    categoryMainMenu = List.from(json['category_main_menu']).map((e)=>CategoryMainMenu.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banner_section'] = bannerSection!.map((e)=>e.toJson()).toList();
    _data['restaurant_main_menu'] = restaurantMainMenu!.map((e)=>e.toJson()).toList();
    _data['category_main_menu'] = categoryMainMenu!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BannerSection {
  BannerSection({
    this.bannerBackgroundImage,
    this.bannerImage,
    this.bannerTitle,
    this.bannerSubTitle,
    this.bannerButtonText,
    this.bannerButtonUrl,
  });
  String ?bannerBackgroundImage;
  String ?bannerImage;
  String ?bannerTitle;
  String ?bannerSubTitle;
  String ?bannerButtonText;
  String ?bannerButtonUrl;

  BannerSection.fromJson(Map<String, dynamic> json){
    bannerBackgroundImage = json['banner_background_image'];
    bannerImage = json['banner_image'];
    bannerTitle = json['banner_title'];
    bannerSubTitle = json['banner_sub_title'];
    bannerButtonText = json['banner_button_text'];
    bannerButtonUrl = json['banner_button_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['banner_background_image'] = bannerBackgroundImage;
    _data['banner_image'] = bannerImage;
    _data['banner_title'] = bannerTitle;
    _data['banner_sub_title'] = bannerSubTitle;
    _data['banner_button_text'] = bannerButtonText;
    _data['banner_button_url'] = bannerButtonUrl;
    return _data;
  }
}

class RestaurantMainMenu {
  RestaurantMainMenu({
    this.categoryImg,
    this.categoryName,
    this.categorySlug,
  });
  String ?categoryImg;
  String ?categoryName;
  String ?categorySlug;

  RestaurantMainMenu.fromJson(Map<String, dynamic> json){
    categoryImg = json['category_img'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_img'] = categoryImg;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    return _data;
  }
}

class CategoryMainMenu {
  CategoryMainMenu({
    this.categoryImg,
    this.categoryName,
    this.categorySlug,
    this.categoryDescription,
  });
  String ?categoryImg;
  String ?categoryName;
  String ?categorySlug;
  String ?categoryDescription;

  CategoryMainMenu.fromJson(Map<String, dynamic> json){
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