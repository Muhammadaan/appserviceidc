import 'package:flutter/material.dart';
import 'package:tokokita/models/domisili_response.dart';
import 'package:tokokita/models/payment_response.dart';
import 'package:tokokita/service/data_service.dart';
import './order_screen.dart';

abstract class OrderScreenViewModel extends State<OrderScreen> {
  // Add your state and logic here

  bool isLoad = true;
  int domisiliId;
  String domisiliName;
  int paymentId;
  String paymentName;
  TextEditingController addressCtrl = TextEditingController();
  TextEditingController addressNoteCtrl = TextEditingController();
  TextEditingController latitudeCtrl = TextEditingController();
  TextEditingController longtitudeCtrl = TextEditingController();
  List<dynamic> listDomisili = [];
  List<dynamic> listPayment = [];
  // List<dynamic> listDomisili = [
  //   {"id": 1, "nama": "domisili1"},
  //   {"id": 2, "nama": "domisili2"},
  // ];
  // List<dynamic> listPayment = [
  //   {"id": 1, "nama": "payment 1"},
  //   {"id": 2, "nama": "payment 2"},
  // ];
  DomisliResponse domisliResponse;
  PayementResponse payementResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    domisliResponse = await DataService.getListDomisili();
    payementResponse = await DataService.getListPayment();

    domisliResponse.data.domisili.map((e) {
      listDomisili.add({"id": e.id, "nama": e.name});
    }).toList();

    payementResponse.data.methodPayment.map((e) {
      listPayment.add({"id": e.id, "nama": e.name});
    }).toList();

    setState(() {
      isLoad = false;
    });
  }
}
