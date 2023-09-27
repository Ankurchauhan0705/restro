class OrderDetailsmodel {
  OrderDetails? orderDetails;

  OrderDetailsmodel({this.orderDetails});

  OrderDetailsmodel.fromJson(Map<String, dynamic> json) {
    orderDetails = json['order_details'] != null
        ? new OrderDetails.fromJson(json['order_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderDetails != null) {
      data['order_details'] = this.orderDetails!.toJson();
    }
    return data;
  }
}

class OrderDetails {
  int? orderId;
  String? orderStatus;
  List<Items>? items;
  String? subtotalItems;
  String? orderShippingTotal;
  double? value;
  String? date;
  String? orderBillingName;
  String? orderBillingEmail;
  String? orderBillingPhone;
  String? orderBillingAddress1;
  String? orderBillingAddress2;
  String? orderBillingCity;
  String? orderBillingState;
  String? orderBillingCountry;
  String? orderBillingPostcode;
  String? serviceType;
  String? serviceDate;
  String? serviceTime;
  String? orderShippingAddress1;
  String? orderShippingAddress2;
  String? orderShippingCity;
  String? orderShippingState;
  String? orderShippingCountry;
  String? orderShippingPostcode;

  OrderDetails(
      {this.orderId,
        this.orderStatus,
        this.items,
        this.subtotalItems,
        this.orderShippingTotal,
        this.value,
        this.date,
        this.orderBillingName,
        this.orderBillingEmail,
        this.orderBillingPhone,
        this.orderBillingAddress1,
        this.orderBillingAddress2,
        this.orderBillingCity,
        this.orderBillingState,
        this.orderBillingCountry,
        this.orderBillingPostcode,
        this.serviceType,
        this.serviceDate,
        this.serviceTime,
        this.orderShippingAddress1,
        this.orderShippingAddress2,
        this.orderShippingCity,
        this.orderShippingState,
        this.orderShippingCountry,
        this.orderShippingPostcode});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderStatus = json['order_status'];
    if (json['Items'] != null) {
      items = <Items>[];
      json['Items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    subtotalItems = json['subtotal_items'];
    orderShippingTotal = json['order_shipping_total'];
    value = json['Value'];
    date = json['Date'];
    orderBillingName = json['order_billing_name'];
    orderBillingEmail = json['order_billing_email'];
    orderBillingPhone = json['order_billing_phone'];
    orderBillingAddress1 = json['order_billing_address_1'];
    orderBillingAddress2 = json['order_billing_address_2'];
    orderBillingCity = json['order_billing_city'];
    orderBillingState = json['order_billing_state'];
    orderBillingCountry = json['order_billing_country'];
    orderBillingPostcode = json['order_billing_postcode'];
    serviceType = json['service_type'];
    serviceDate = json['service_date'];
    serviceTime = json['service_time'];
    orderShippingAddress1 = json['order_shipping_address_1'];
    orderShippingAddress2 = json['order_shipping_address_2'];
    orderShippingCity = json['order_shipping_city'];
    orderShippingState = json['order_shipping_state'];
    orderShippingCountry = json['order_shipping_country'];
    orderShippingPostcode = json['order_shipping_postcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_status'] = this.orderStatus;
    if (this.items != null) {
      data['Items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['subtotal_items'] = this.subtotalItems;
    data['order_shipping_total'] = this.orderShippingTotal;
    data['Value'] = this.value;
    data['Date'] = this.date;
    data['order_billing_name'] = this.orderBillingName;
    data['order_billing_email'] = this.orderBillingEmail;
    data['order_billing_phone'] = this.orderBillingPhone;
    data['order_billing_address_1'] = this.orderBillingAddress1;
    data['order_billing_address_2'] = this.orderBillingAddress2;
    data['order_billing_city'] = this.orderBillingCity;
    data['order_billing_state'] = this.orderBillingState;
    data['order_billing_country'] = this.orderBillingCountry;
    data['order_billing_postcode'] = this.orderBillingPostcode;
    data['service_type'] = this.serviceType;
    data['service_date'] = this.serviceDate;
    data['service_time'] = this.serviceTime;
    data['order_shipping_address_1'] = this.orderShippingAddress1;
    data['order_shipping_address_2'] = this.orderShippingAddress2;
    data['order_shipping_city'] = this.orderShippingCity;
    data['order_shipping_state'] = this.orderShippingState;
    data['order_shipping_country'] = this.orderShippingCountry;
    data['order_shipping_postcode'] = this.orderShippingPostcode;
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
