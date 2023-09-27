// class ItemforcategoriesModel {
//   ItemforcategoriesModel({
//      this.categoryTitle,
//      this.productDetails,
//   });
//     String ?categoryTitle;
//     List<ProductDetails> ?productDetails;
//
//   ItemforcategoriesModel.fromJson(Map<String, dynamic> json){
//     categoryTitle = json['category_title'];
//     productDetails = List.from(json['product_details']).map((e)=>ProductDetails.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_title'] = categoryTitle;
//     _data['product_details'] = productDetails!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class ProductDetails {
//   ProductDetails({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productDiscription,
//      this.productPrice,
//   });
//     int ?productId;
//     String ?productImg;
//     String ?productTitle;
//     String ?productSlug;
//     String ?productDiscription;
//     String ?productPrice;
//
//   ProductDetails.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productDiscription = json['product_discription'];
//     productPrice = json['product_price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_discription'] = productDiscription;
//     _data['product_price'] = productPrice;
//     return _data;
//   }
// }

//
//
// class ItemforcategoriesModel {
//   ItemforcategoriesModel({
//      this.categoryTitle,
//      this.productDetails,
//   });
//     String ?categoryTitle;
//     List<ProductDetails> ?productDetails;
//
//   ItemforcategoriesModel.fromJson(Map<String, dynamic> json){
//     categoryTitle = json['category_title'];
//     productDetails = List.from(json['product_details']).map((e)=>ProductDetails.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['category_title'] = categoryTitle;
//     _data['product_details'] = productDetails!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class ProductDetails {
//   ProductDetails({
//      this.productId,
//      this.productImg,
//      this.productTitle,
//      this.productSlug,
//      this.productDiscription,
//      this.productPrice,
//   });
//     int ?productId;
//     String ?productImg;
//     String ?productTitle;
//     String ?productSlug;
//     String ?productDiscription;
//     String ?productPrice;
//
//   ProductDetails.fromJson(Map<String, dynamic> json){
//     productId = json['product_id'];
//     productImg = json['product_img'];
//     productTitle = json['product_title'];
//     productSlug = json['product_slug'];
//     productDiscription = json['product_discription'];
//     productPrice = json['product_price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_id'] = productId;
//     _data['product_img'] = productImg;
//     _data['product_title'] = productTitle;
//     _data['product_slug'] = productSlug;
//     _data['product_discription'] = productDiscription;
//     _data['product_price'] = productPrice;
//     return _data;
//   }
// }


class ItemforcategoriesModel {
  ItemforcategoriesModel({
     this.categoryTitle,
     this.productCategory,
     this.currentPage,
     this.totalPages,
  });
    String ?categoryTitle;
    List<ProductCategory> ?productCategory;
    int ?currentPage;
    int ?totalPages;

  ItemforcategoriesModel.fromJson(Map<String, dynamic> json){
    categoryTitle = json['category_title'];
    productCategory = List.from(json['product_category']).map((e)=>ProductCategory.fromJson(e)).toList();
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category_title'] = categoryTitle;
    _data['product_category'] = productCategory!.map((e)=>e.toJson()).toList();
    _data['current_page'] = currentPage;
    _data['total_pages'] = totalPages;
    return _data;
  }
}

class ProductCategory {
  ProductCategory({
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

  ProductCategory.fromJson(Map<String, dynamic> json){
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