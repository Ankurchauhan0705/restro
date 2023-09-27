class CategoriesModel {
  CategoriesModel({
   this.productCategory,
  });
   List<ProductCategory> ? productCategory;

  CategoriesModel.fromJson(Map<String, dynamic> json){
    print('from json errorggggggg');
try{
  productCategory = List.from(json['product_category']).map((e)=>ProductCategory.fromJson(e)).toList();


}
catch(e){
  print(e);
}
    print('from json errorggggggggggggggggggggggggggggggggggggggggggggggggggggg');
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_category'] = productCategory!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProductCategory {
  ProductCategory({
     this.categoryId,
     this.categoryImg,
     this.categoryName,
     this.categorySlug,
     // this.categoryDescription,
     // this.categoryCount,
  });
     dynamic categoryId;
    String ?categoryImg;
    String ?categoryName;
    String ?categorySlug;
    // String ?categoryDescription;
    // int ?categoryCount;

  ProductCategory.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    categoryImg = json['category_img'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    // categoryDescription = json['category_description'];
    // categoryCount = json['category_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['category_img'] = categoryImg;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    // _data['category_description'] = categoryDescription;
    // _data['category_count'] = categoryCount;
    return _data;
  }
}