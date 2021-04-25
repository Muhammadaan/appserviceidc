class CreateOrderResponse {
  int status;
  String message;
  int pageWaitingPayment;
  List<Order> order;

  CreateOrderResponse(
      {this.status, this.message, this.pageWaitingPayment, this.order});

  CreateOrderResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    pageWaitingPayment = json['page_waiting_payment'];
    if (json['order'] != null) {
      order = new List<Order>();
      json['order'].forEach((v) {
        order.add(new Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['page_waiting_payment'] = this.pageWaitingPayment;
    if (this.order != null) {
      data['order'] = this.order.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  int id;

  Order({this.id});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
