
class OrderModel {
  OrderModel({
     this.id,
     this.parentId,
     this.status,
     this.currency,
     this.version,
     this.pricesIncludeTax,
     this.dateCreated,
     this.dateModified,
     this.discountTotal,
     this.discountTax,
     this.shippingTotal,
     this.shippingTax,
     this.cartTax,
     this.total,
     this.totalTax,
     this.customerId,
     this.orderKey,
     this.billing,
     this.shipping,
     this.paymentMethod,
     this.paymentMethodTitle,
     this.transactionId,
     this.customerIpAddress,
     this.customerUserAgent,
     this.createdVia,
     this.customerNote,
    this.dateCompleted,
     this.datePaid,
     this.cartHash,
     this.number,
     this.metaData,
     this.lineItems,
     this.taxLines,
     this.shippingLines,
     this.feeLines,
     this.couponLines,
     this.refunds,
     this.paymentUrl,
     this.isEditable,
     this.needsPayment,
     this.needsProcessing,
     this.dateCreatedGmt,
     this.dateModifiedGmt,
    this.dateCompletedGmt,
     this.datePaidGmt,
     this.currencySymbol,
     this.links,
  });
    int ?id;
    int ?parentId;
    String ?status;
    String ?currency;
    String ?version;
    bool ?pricesIncludeTax;
    String ?dateCreated;
    String ?dateModified;
    String ?discountTotal;
    String ?discountTax;
    String ?shippingTotal;
    String ?shippingTax;
    String ?cartTax;
    String ?total;
    String ?totalTax;
    int ?customerId;
    String ?orderKey;
    Billing ?billing;
    Shipping ?shipping;
   String ?paymentMethod;
   String ?paymentMethodTitle;
   String ?transactionId;
   String ?customerIpAddress;
   String ?customerUserAgent;
   String ?createdVia;
   String ?customerNote;
   Null ?dateCompleted;
   String ?datePaid;
   String ?cartHash;
   String ?number;
   List<MetaData> ?metaData;
   List<LineItems> ?lineItems;
   List<dynamic> ?taxLines;
   List<ShippingLines> ?shippingLines;
    List<dynamic> ?feeLines;
    List<dynamic> ?couponLines;
    List<dynamic> ?refunds;
    String ?paymentUrl;
    bool ?isEditable;
    bool ?needsPayment;
    bool ?needsProcessing;
    String ?dateCreatedGmt;
    String ?dateModifiedGmt;
    Null ?dateCompletedGmt;
    String ?datePaidGmt;
    String ?currencySymbol;
    Uri ?links;

  OrderModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    parentId = json['parent_id'];
    status = json['status'];
    currency = json['currency'];
    version = json['version'];
    pricesIncludeTax = json['prices_include_tax'];
    dateCreated = json['date_created'];
    dateModified = json['date_modified'];
    discountTotal = json['discount_total'];
    discountTax = json['discount_tax'];
    shippingTotal = json['shipping_total'];
    shippingTax = json['shipping_tax'];
    cartTax = json['cart_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    customerId = json['customer_id'];
    orderKey = json['order_key'];
    billing = Billing.fromJson(json['billing']);
    shipping = Shipping.fromJson(json['shipping']);
    paymentMethod = json['payment_method'];
    paymentMethodTitle = json['payment_method_title'];
    transactionId = json['transaction_id'];
    customerIpAddress = json['customer_ip_address'];
    customerUserAgent = json['customer_user_agent'];
    createdVia = json['created_via'];
    customerNote = json['customer_note'];
    dateCompleted = null;
    datePaid = json['date_paid'];
    cartHash = json['cart_hash'];
    number = json['number'];
    metaData = List.from(json['meta_data']).map((e)=>MetaData.fromJson(e)).toList();
    lineItems = List.from(json['line_items']).map((e)=>LineItems.fromJson(e)).toList();
    taxLines = List.castFrom<dynamic, dynamic>(json['tax_lines']);
    shippingLines = List.from(json['shipping_lines']).map((e)=>ShippingLines.fromJson(e)).toList();
    feeLines = List.castFrom<dynamic, dynamic>(json['fee_lines']);
    couponLines = List.castFrom<dynamic, dynamic>(json['coupon_lines']);
    refunds = List.castFrom<dynamic, dynamic>(json['refunds']);
    paymentUrl = json['payment_url'];
    isEditable = json['is_editable'];
    needsPayment = json['needs_payment'];
    needsProcessing = json['needs_processing'];
    dateCreatedGmt = json['date_created_gmt'];
    dateModifiedGmt = json['date_modified_gmt'];
    dateCompletedGmt = null;
    datePaidGmt = json['date_paid_gmt'];
    currencySymbol = json['currency_symbol'];
    links = json['_links'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['parent_id'] = parentId;
    _data['status'] = status;
    _data['currency'] = currency;
    _data['version'] = version;
    _data['prices_include_tax'] = pricesIncludeTax;
    _data['date_created'] = dateCreated;
    _data['date_modified'] = dateModified;
    _data['discount_total'] = discountTotal;
    _data['discount_tax'] = discountTax;
    _data['shipping_total'] = shippingTotal;
    _data['shipping_tax'] = shippingTax;
    _data['cart_tax'] = cartTax;
    _data['total'] = total;
    _data['total_tax'] = totalTax;
    _data['customer_id'] = customerId;
    _data['order_key'] = orderKey;
    _data['billing'] = billing;
    _data['shipping'] = shipping;
    _data['payment_method'] = paymentMethod;
    _data['payment_method_title'] = paymentMethodTitle;
    _data['transaction_id'] = transactionId;
    _data['customer_ip_address'] = customerIpAddress;
    _data['customer_user_agent'] = customerUserAgent;
    _data['created_via'] = createdVia;
    _data['customer_note'] = customerNote;
    _data['date_completed'] = dateCompleted;
    _data['date_paid'] = datePaid;
    _data['cart_hash'] = cartHash;
    _data['number'] = number;
    _data['meta_data'] = metaData!.map((e)=>e.toJson()).toList();
    _data['line_items'] = lineItems!.map((e)=>e.toJson()).toList();
    _data['tax_lines'] = taxLines;
    _data['shipping_lines'] = shippingLines!.map((e)=>e.toJson()).toList();
    _data['fee_lines'] = feeLines;
    _data['coupon_lines'] = couponLines;
    _data['refunds'] = refunds;
    _data['payment_url'] = paymentUrl;
    _data['is_editable'] = isEditable;
    _data['needs_payment'] = needsPayment;
    _data['needs_processing'] = needsProcessing;
    _data['date_created_gmt'] = dateCreatedGmt;
    _data['date_modified_gmt'] = dateModifiedGmt;
    _data['date_completed_gmt'] = dateCompletedGmt;
    _data['date_paid_gmt'] = datePaidGmt;
    _data['currency_symbol'] = currencySymbol;
    _data['_links'] = links;
    return _data;
  }
}

class Billing {
  Billing({
     this.firstName,
     this.lastName,
     this.company,
     this.address_1,
     this.address_2,
     this.city,
     this.state,
     this.postcode,
     this.country,
     this.email,
     this.phone,
  });
    String ?firstName;
    String ?lastName;
    String ?company;
    String ?address_1;
    String ?address_2;
    String ?city;
    String ?state;
    String ?postcode;
    String ?country;
    String ?email;
    String ?phone;

  Billing.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company'] = company;
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    _data['email'] = email;
    _data['phone'] = phone;
    return _data;
  }
}

class Shipping {
  Shipping({
     this.firstName,
     this.lastName,
     this.company,
     this.address_1,
     this.address_2,
     this.city,
     this.state,
     this.postcode,
     this.country,
     this.phone,
  });
    String ?firstName;
    String ?lastName;
    String ?company;
    String ?address_1;
    String ?address_2;
    String ?city;
    String ?state;
    String ?postcode;
    String ?country;
    String ?phone;

  Shipping.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    lastName = json['last_name'];
    company = json['company'];
    address_1 = json['address_1'];
    address_2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    postcode = json['postcode'];
    country = json['country'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['company'] = company;
    _data['address_1'] = address_1;
    _data['address_2'] = address_2;
    _data['city'] = city;
    _data['state'] = state;
    _data['postcode'] = postcode;
    _data['country'] = country;
    _data['phone'] = phone;
    return _data;
  }
}

class MetaData {
  MetaData({
     this.id,
     this.key,
     this.value,
  });
    int ?id;
    String ?key;
    String ?value;

  MetaData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['key'] = key;
    _data['value'] = value;
    return _data;
  }
}

class LineItems {
  LineItems({
     this.id,
     this.name,
     this.productId,
     this.variationId,
     this.quantity,
     this.taxClass,
     this.subtotal,
     this.subtotalTax,
     this.total,
     this.totalTax,
     this.taxes,
     this.metaData,
     this.sku,
     this.price,
     this.image,
    this.parentName,
     this.startDate,
     this.endDate,
  });
    int ?id;
    String ?name;
    int ?productId;
    int ?variationId;
    int ?quantity;
    String ?taxClass;
    String ?subtotal;
    String ?subtotalTax;
    String ?total;
    String ?totalTax;
    List<dynamic> ?taxes;
    List<dynamic> ?metaData;
    String ?sku;
    double ?price;
    Image ?image;
    Null ?parentName;
    String ?startDate;
    String ?endDate;

  LineItems.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    quantity = json['quantity'];
    taxClass = json['tax_class'];
    subtotal = json['subtotal'];
    subtotalTax = json['subtotal_tax'];
    total = json['total'];
    totalTax = json['total_tax'];
    taxes = List.castFrom<dynamic, dynamic>(json['taxes']);
    metaData = List.castFrom<dynamic, dynamic>(json['meta_data']);
    sku = json['sku'];
    price = json['price'];
    image = Image.fromJson(json['image']);
    parentName = null;
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['product_id'] = productId;
    _data['variation_id'] = variationId;
    _data['quantity'] = quantity;
    _data['tax_class'] = taxClass;
    _data['subtotal'] = subtotal;
    _data['subtotal_tax'] = subtotalTax;
    _data['total'] = total;
    _data['total_tax'] = totalTax;
    _data['taxes'] = taxes;
    _data['meta_data'] = metaData;
    _data['sku'] = sku;
    _data['price'] = price;
    _data['image'] = image;
    _data['parent_name'] = parentName;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    return _data;
  }
}

class Image {
  Image({
     this.id,
     this.src,
  });
    String ?id;
    String ?src;

  Image.fromJson(Map<String, dynamic> json){
    id = json['id'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['src'] = src;
    return _data;
  }
}

class ShippingLines {
  ShippingLines({
     this.id,
     this.methodTitle,
     this.methodId,
     this.instanceId,
     this.total,
     this.totalTax,
     this.taxes,
     this.metaData,
  });
    int ?id;
    String ?methodTitle;
    String ?methodId;
    String ?instanceId;
    String ?total;
    String ?totalTax;
    List<dynamic> ?taxes;
    List<dynamic> ?metaData;

  ShippingLines.fromJson(Map<String, dynamic> json){
    id = json['id'];
    methodTitle = json['method_title'];
    methodId = json['method_id'];
    instanceId = json['instance_id'];
    total = json['total'];
    totalTax = json['total_tax'];
    taxes = List.castFrom<dynamic, dynamic>(json['taxes']);
    metaData = List.castFrom<dynamic, dynamic>(json['meta_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['method_title'] = methodTitle;
    _data['method_id'] = methodId;
    _data['instance_id'] = instanceId;
    _data['total'] = total;
    _data['total_tax'] = totalTax;
    _data['taxes'] = taxes;
    _data['meta_data'] = metaData;
    return _data;
  }
}

class _links {
  _links({
     this.self,
     this.collection,
  });
    List<Self> ?self;
    List<Collection> ?collection;

  _links.fromJson(Map<String, dynamic> json){
    self = List.from(json['self']).map((e)=>Self.fromJson(e)).toList();
    collection = List.from(json['collection']).map((e)=>Collection.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['self'] = self!.map((e)=>e.toJson()).toList();
    _data['collection'] = collection!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Self {
  Self({
     this.href,
  });
    String ?href;

  Self.fromJson(Map<String, dynamic> json){
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}

class Collection {
  Collection({
     this.href,
  });
    String ?href;

  Collection.fromJson(Map<String, dynamic> json){
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['href'] = href;
    return _data;
  }
}