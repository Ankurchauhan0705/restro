class SearchModel {
  SearchModel({
     this.productSearching,
     this.productCategorySearching,
  });
    ProductSearching ?productSearching;
    ProductCategorySearching ?productCategorySearching;

  SearchModel.fromJson(Map<String, dynamic> json){
    productSearching = ProductSearching.fromJson(json['product_searching']);
    productCategorySearching = ProductCategorySearching.fromJson(json['product_category_searching']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_searching'] = productSearching!.toJson();
    _data['product_category_searching'] = productCategorySearching!.toJson();
    return _data;
  }
}

class ProductSearching {
  ProductSearching({
     this.searchProduct,
  });
    List<SearchProduct> ?searchProduct;

  ProductSearching.fromJson(Map<String, dynamic> json){
    searchProduct = List.from(json['search_product']).map((e)=>SearchProduct.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['search_product'] = searchProduct!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SearchProduct {
  SearchProduct({
     this.productId,
     this.productImg,
     this.productTitle,
     this.productSlug,
     this.productDiscription,
     this.productPrice,
  });
    int ?productId;
    String ?productImg;
    String ?productTitle;
    String ?productSlug;
    String ?productDiscription;
    String ?productPrice;

  SearchProduct.fromJson(Map<String, dynamic> json){
    productId = json['product_id'];
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productSlug = json['product_slug'];
    productDiscription = json['product_discription'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_id'] = productId;
    _data['product_img'] = productImg;
    _data['product_title'] = productTitle;
    _data['product_slug'] = productSlug;
    _data['product_discription'] = productDiscription;
    _data['product_price'] = productPrice;
    return _data;
  }
}

class ProductCategorySearching {
  ProductCategorySearching({
     this.searchCategory,
  });
    List<SearchCategory> ?searchCategory;

  ProductCategorySearching.fromJson(Map<String, dynamic> json){
    searchCategory = List.from(json['search_category']).map((e)=>SearchCategory.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['search_category'] = searchCategory!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SearchCategory {
  SearchCategory({
     this.categoryId,
     this.categoryImg,
     this.categoryName,
     this.categorySlug,
     this.categoryCount,
  });
  int ?categoryId;
    String ?categoryImg;
    String ?categoryName;
    String ?categorySlug;
    int ?categoryCount;

  SearchCategory.fromJson(Map<String, dynamic> json){
    categoryId = json['category_id'];
    categoryImg = json['category_img'];
    categoryName = json['category_name'];
    categorySlug = json['category_slug'];
    categoryCount = json['category_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_id'] = categoryId;
    _data['category_img'] = categoryImg;
    _data['category_name'] = categoryName;
    _data['category_slug'] = categorySlug;
    _data['category_count'] = categoryCount;
    return _data;
  }
}