class myordermodel {
  List<OrderDetails>? orderDetails;

  myordermodel({this.orderDetails});

  myordermodel.fromJson(Map<String, dynamic> json) {
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderDetails {
  int? iD;
  List<Items>? items;
  String? value;
  String? date;

  OrderDetails({this.iD, this.items, this.value, this.date});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    if (json['Items'] != null) {
      items = <Items>[];
      json['Items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    value = json['Value'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    if (this.items != null) {
      data['Items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['Value'] = this.value;
    data['Date'] = this.date;
    return data;
  }
}

class Items {
  int? quantity;
  String? item;

  Items({this.quantity, this.item});

  Items.fromJson(Map<String, dynamic> json) {
    quantity = json['Quantity'];
    item = json['Item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Quantity'] = this.quantity;
    data['Item'] = this.item;
    return data;
  }
}
