import 'package:flutter/material.dart';
import 'package:tokokita/models/list_package_response.dart';
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
    ctrlListComment = List.generate(
        packageListResponse.data.length, (i) => TextEditingController());

    setState(() {
      isLoad = false;
    });
  }

  toNextPage() {
    ctrlListQuantity.map((e) {
      listQty.add({
        "quantity": e.text,
      });
    }).toList();
    ctrlListComment.map((e) {
      listComent.add({"comment": e.text});
    }).toList();

    var newList = List.from(listQty)..addAll(listComent);

    print(newList);
  }
}
