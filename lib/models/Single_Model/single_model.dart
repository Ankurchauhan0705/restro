class SingleModel {
  SingleModel({
     this.singleProduct,
  });
    List<SingleProduct> ?singleProduct;

  SingleModel.fromJson(Map<String, dynamic> json){
    singleProduct =
    json['single_product'] == null? []:
        List.from(json['single_product']).map((e)=>SingleProduct.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['single_product'] = singleProduct!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SingleProduct {
  SingleProduct({
     this.productImg,
     this.menuTitle,
     this.menuDiscription,
     this.productPrice,
  });
    String ?productImg;
    String ?menuTitle;
    String ?menuDiscription;
    String ?productPrice;

  SingleProduct.fromJson(Map<String, dynamic> json){
    productImg = json['product_img'];
    menuTitle = json['menu_title'];
    menuDiscription = json['menu_discription'];
    productPrice = json['product_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['product_img'] = productImg;
    _data['menu_title'] = menuTitle;
    _data['menu_discription'] = menuDiscription;
    _data['product_price'] = productPrice;
    return _data;
  }
}