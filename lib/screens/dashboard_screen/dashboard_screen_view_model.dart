import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokokita/models/service_response.dart';
import 'package:tokokita/service/data_service.dart';
import './dashboard_screen.dart';

abstract class DashboardScreenViewModel extends State<DashboardScreen> {
  // Add your state and logic here

  bool isLoad = true;
  ServiceResponse serviceResponse;
  String nama = '';
  String hp = '';
  String email = '';
  SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    prefs = await SharedPreferences.getInstance();
    nama = prefs.getString('nama');
    email = prefs.getString('email');
    hp = prefs.getString('hp');
    serviceResponse = await DataService.getService();

    print(serviceResponse.toString());
    setState(() {
      isLoad = false;
    });
  }
}
