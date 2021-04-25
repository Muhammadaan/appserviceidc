import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './splash_screen.dart';

abstract class SplashScreenViewModel extends State<SplashScreen> {
  // Add your state and logic here
  bool status = false;
  SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cekLogin();
  }

  cekLogin() async {
    prefs = await SharedPreferences.getInstance();
    // will be null if never previously saved
    status = prefs.getBool('is_login');
    if (status == true) {
      Future.delayed(const Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, "/dashboard"));
    } else {
      Future.delayed(const Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, "/login"));
    }
  }
}
