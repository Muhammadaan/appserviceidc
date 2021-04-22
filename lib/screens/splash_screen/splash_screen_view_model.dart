import 'package:flutter/material.dart';
import './splash_screen.dart';

abstract class SplashScreenViewModel extends State<SplashScreen> {
  // Add your state and logic here

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, "/login"));
  }
}
