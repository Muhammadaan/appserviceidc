import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tokokita/models/create_order_request.dart';
import 'package:tokokita/models/create_order_request.dart' as CO;
import 'package:tokokita/models/create_order_response.dart';
import 'package:tokokita/models/domisili_response.dart';
import 'package:tokokita/models/payment_response.dart';
import 'package:tokokita/screens/waiting_screen/waiting_screen.dart';
import 'package:tokokita/service/data_service.dart';
import 'package:tokokita/utils/app_helper.dart';
import './order_screen.dart';

abstract class OrderScreenViewModel extends State<OrderScreen> {
  // Add your state and logic here

  bool isLoad = true;
  bool isLoadPost = false;
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
  List<dynamic> listpackegeData = [
    {"id": 1, "quantity": 20, "comment": "Rusak"},
    {"id": 2, "quantity": 20, "comment": "Baik"}
  ];

  DomisliResponse domisliResponse;
  PayementResponse payementResponse;
  CreateOrderResponse createOrderResponse;

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

  order() async {
    if (!AppHelper.isNullOrEmptyString(addressCtrl.text) ||
        !AppHelper.isNullOrEmptyString(addressNoteCtrl.text) ||
        !AppHelper.isNullOrEmptyString(latitudeCtrl.text) ||
        !AppHelper.isNullOrEmptyString(longtitudeCtrl.text)) {
      setState(() {
        isLoadPost = true;
      });
      var nowDate = DateTime.now();
      List<CO.ArrayPackage> listPackage = List<CO.ArrayPackage>();

      listpackegeData
          .map((e) => listPackage.add(CO.ArrayPackage(
              id: e['id'], quantity: e['quantity'], comment: e['comment'])))
          .toList();
      CreateOrderRequest req = CreateOrderRequest(
          dateTimeOrdered: nowDate.toString(),
          address: addressCtrl.text,
          addressNote: addressNoteCtrl.text,
          latitude: latitudeCtrl.text,
          longitude: longtitudeCtrl.text,
          methodPaymentId: paymentId,
          domisiliId: domisiliId,
          arrayPackage: listPackage);

      log(jsonEncode(req));
      createOrderResponse = await DataService.createdOrder(dataorder: req);

      setState(() {
        isLoadPost = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => WaitingScreen(
            id: createOrderResponse.order.first.id,
            waiting: createOrderResponse.pageWaitingPayment,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 3),
          content: const Text('All inputs are required!!!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
