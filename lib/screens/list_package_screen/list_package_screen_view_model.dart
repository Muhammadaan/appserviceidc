import 'package:flutter/material.dart';
import 'package:tokokita/models/list_package_response.dart';
import 'package:tokokita/service/data_service.dart';
import './list_package_screen.dart';

abstract class ListPackageScreenViewModel extends State<ListPackageScreen> {
  // Add your state and logic here

  bool isLoad = true;
  PackageListResponse packageListResponse;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    packageListResponse = await DataService.getListPackage(id: 1);

    setState(() {
      isLoad = false;
    });
  }
}
