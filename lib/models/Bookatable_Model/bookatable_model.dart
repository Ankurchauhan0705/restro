class BookatableModel {
  BookatableModel({
    this.bookingTableDetails,
  });
   List<BookingTableDetails> ?bookingTableDetails;

  BookatableModel.fromJson(Map<String, dynamic> json){
    bookingTableDetails = List.from(json['booking_table_details']).map((e)=>BookingTableDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['booking_table_details'] = bookingTableDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class BookingTableDetails {
  BookingTableDetails({
     this.Code,
     this.Status,
     this.Message,
  });
   String ?Code;
   String ?Status;
   String ?Message;

  BookingTableDetails.fromJson(Map<String, dynamic> json){
    Code = json['Code'];
    Status = json['Status'];
    Message = json['Message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['Code'] = Code;
    _data['Status'] = Status;
    _data['Message'] = Message;
    return _data;
  }
}