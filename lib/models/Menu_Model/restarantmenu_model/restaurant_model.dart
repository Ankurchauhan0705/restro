class ButtonmenuModel {
  ButtonmenuModel({
    this.restaurantMenuCategory,
  });
  List<RestaurantMenuCategory>? restaurantMenuCategory;

  ButtonmenuModel.fromJson(Map<String, dynamic> json) {
    restaurantMenuCategory = List.from(json['restaurant_menu_category'])
        .map((e) => RestaurantMenuCategory.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['restaurant_menu_category'] =
        restaurantMenuCategory!.map((e) => e.toJson()).toList();
    return _data;
  }
}

class RestaurantMenuCategory {
  RestaurantMenuCategory({
    this.categoryName,
    this.categorySlug,
  });
  String? categoryName;
  String? categorySlug;

  RestaurantMenuCategory.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    print(categoryName);
    print(categorySlug);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    return _data;
  }
}
