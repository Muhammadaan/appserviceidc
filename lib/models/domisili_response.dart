class DomisliResponse {
  String message;
  Data data;

  DomisliResponse({this.message, this.data});

  DomisliResponse.fromJson(Map<String, dynamic> json) {
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
  List<Domisili> domisili;

  Data({this.domisili});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['domisili'] != null) {
      domisili = new List<Domisili>();
      json['domisili'].forEach((v) {
        domisili.add(new Domisili.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.domisili != null) {
      data['domisili'] = this.domisili.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Domisili {
  int id;
  String name;
  String createdAt;
  String updatedAt;

  Domisili({this.id, this.name, this.createdAt, this.updatedAt});

  Domisili.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
