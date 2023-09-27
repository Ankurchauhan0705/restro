// class SingleitemproductModel {
//   SingleitemproductModel({
//      this.singleProduct,
//   });
//     List<SingleProduct> ?singleProduct;
//
//   SingleitemproductModel.fromJson(Map<String, dynamic> json){
//     singleProduct = List.from(json['single_product']).map((e)=>SingleProduct.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['single_product'] = singleProduct!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class SingleProduct {
//   SingleProduct({
//      this.productImg,
//      this.menuTitle,
//      this.menuDiscription,
//      this.productPrice,
//   });
//     String ?productImg;
//     String ?menuTitle;
//     String ?menuDiscription;
//     String ?productPrice;
//
//   SingleProduct.fromJson(Map<String, dynamic> json){
//     productImg = json['product_img'];
//     menuTitle = json['menu_title'];
//     menuDiscription = json['menu_discription'];
//     productPrice = json['product_price'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['product_img'] = productImg;
//     _data['menu_title'] = menuTitle;
//     _data['menu_discription'] = menuDiscription;
//     _data['product_price'] = productPrice;
//     return _data;
//   }
// }

class SingleitemproductModel {
  SingleitemproductModel({
     this.singleProduct,
     this.variations,
  });
    List<SingleProduct> ?singleProduct;
    List<Variations> ?variations;

  SingleitemproductModel.fromJson(Map<String, dynamic> json){
    singleProduct = List.from(json['single_product']).map((e)=>SingleProduct.fromJson(e)).toList();
    variations =
    json['variations'] =='null' ? [] :
        List.from(json['variations']).map((e)=>Variations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['single_product'] = singleProduct!.map((e)=>e.toJson()).toList();
    _data['variations'] = variations!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SingleProduct {
  SingleProduct({
     this.productImg,
     this.productTitle,
     this.productDiscription,
     this.productPrice,
  });
    String ?productImg;
    String ?productTitle;
    String ?productDiscription;
    String ?productPrice;

  SingleProduct.fromJson(Map<String, dynamic> json){
    productImg = json['product_img'];
    productTitle = json['product_title'];
    productDiscription = json['product_discription'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_img'] = productImg;
    _data['product_title'] = productTitle;
    _data['product_discription'] = productDiscription;
    _data['product_price'] = productPrice;
    return _data;
  }
}

class Variations {
  Variations({
     this.varisationID,
     this.varisationTitle,
     this.varisationPrice,
  });
    int ?varisationID;
    String ?varisationTitle;
    String ?varisationPrice;

  Variations.fromJson(Map<String, dynamic> json){
    varisationID = json['varisation_ID'];
    varisationTitle = json['varisation_title'];
    varisationPrice = json['varisation_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['varisation_ID'] = varisationID;
    _data['varisation_title'] = varisationTitle;
    _data['varisation_price'] = varisationPrice;
    return _data;
  }
}