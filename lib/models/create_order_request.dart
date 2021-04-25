class CreateOrderRequest {
  String dateTimeOrdered;
  String address;
  String addressNote;
  String longitude;
  String latitude;
  int domisiliId;
  int methodPaymentId;
  List<ArrayPackage> arrayPackage;

  CreateOrderRequest(
      {this.dateTimeOrdered,
      this.address,
      this.addressNote,
      this.longitude,
      this.latitude,
      this.domisiliId,
      this.methodPaymentId,
      this.arrayPackage});

  CreateOrderRequest.fromJson(Map<String, dynamic> json) {
    dateTimeOrdered = json['date_time_ordered'];
    address = json['address'];
    addressNote = json['address_note'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    domisiliId = json['domisili_id'];
    methodPaymentId = json['method_payment_id'];
    if (json['array_package'] != null) {
      arrayPackage = new List<ArrayPackage>();
      json['array_package'].forEach((v) {
        arrayPackage.add(new ArrayPackage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_time_ordered'] = this.dateTimeOrdered;
    data['address'] = this.address;
    data['address_note'] = this.addressNote;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['domisili_id'] = this.domisiliId;
    data['method_payment_id'] = this.methodPaymentId;
    if (this.arrayPackage != null) {
      data['array_package'] = this.arrayPackage.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ArrayPackage {
  int id;
  int quantity;
  String comment;

  ArrayPackage({this.id, this.quantity, this.comment});

  ArrayPackage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['comment'] = this.comment;
    return data;
  }
}
