import 'package:flutter/material.dart';
import 'package:tokokita/models/list_package_response.dart';
import 'package:tokokita/screens/order_screen/order_screen.dart';
import 'package:tokokita/service/data_service.dart';
import './list_package_screen.dart';

abstract class ListPackageScreenViewModel extends State<ListPackageScreen> {
  // Add your state and logic here

  bool isLoad = true;
  PackageListResponse packageListResponse;
  List<TextEditingController> ctrlListQuantity;
  List<TextEditingController> ctrlListComment;
  List<dynamic> listPackage = [];
  List<dynamic> listQty = [];
  List<dynamic> listComent = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    packageListResponse = await DataService.getListPackage(id: 1);

    ctrlListQuantity = List.generate(
        packageListResponse.data.length, (i) => TextEditingController());

    setState(() {
      isLoad = false;
    });
  }

  toNextPage() {
    ctrlListQuantity.map((e) {
      listQty.add({"id": e.value, "quantity": e.text, "comment": "Rusak"});
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderScreen(),
      ),
    );
  }
}
