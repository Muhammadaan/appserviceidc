class PayementResponse {
  String message;
  Data data;

  PayementResponse({this.message, this.data});

  PayementResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<MethodPayment> methodPayment;

  Data({this.methodPayment});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['method_payment'] != null) {
      methodPayment = new List<MethodPayment>();
      json['method_payment'].forEach((v) {
        methodPayment.add(new MethodPayment.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.methodPayment != null) {
      data['method_payment'] =
          this.methodPayment.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MethodPayment {
  int id;
  String name;
  Null description;
  String image;
  String status;
  String createdAt;
  String updatedAt;
  String imageUrl;

  MethodPayment(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  MethodPayment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
