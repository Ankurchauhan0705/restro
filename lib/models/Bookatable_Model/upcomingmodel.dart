class UpcomingModel {
  UpcomingModel({
     this.bookingDetails,
  });
    List<BookingDetails> ?bookingDetails;

  UpcomingModel.fromJson(Map<String, dynamic> json){
    bookingDetails = List.from(json['booking_details']).map((e)=>BookingDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['booking_details'] = bookingDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BookingDetails {
  BookingDetails({
     this.bookingId,
     this.customerName,
     this.customerEmail,
     this.customerMobile,
     this.bookingDate,
     this.bookingTime,
     this.partyPeople,
  });
    int ?bookingId;
    String ?customerName;
    String ?customerEmail;
    String ?customerMobile;
    String ?bookingDate;
    String ?bookingTime;
    String ?partyPeople;

  BookingDetails.fromJson(Map<String, dynamic> json){
    bookingId = json['booking_Id'];
    customerName = json['customer_name'];
    customerEmail = json['customer_email'];
    customerMobile = json['customer_mobile'];
    bookingDate = json['booking_date'];
    bookingTime = json['booking_time'];
    partyPeople = json['party_people'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['booking_Id'] = bookingId;
    _data['customer_name'] = customerName;
    _data['customer_email'] = customerEmail;
    _data['customer_mobile'] = customerMobile;
    _data['booking_date'] = bookingDate;
    _data['booking_time'] = bookingTime;
    _data['party_people'] = partyPeople;
    return _data;
  }
}