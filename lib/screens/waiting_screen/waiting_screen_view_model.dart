import 'package:flutter/material.dart';
import './waiting_screen.dart';

abstract class WaitingScreenViewModel extends State<WaitingScreen> {
  // Add your state and logic here

  bool isLoad = false;
  int waitingStatus;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() {
    setState(() {
      waitingStatus = widget.waiting;
    });

    Future.delayed(const Duration(seconds: 8), () {
      setState(() {
        isLoad = true;
      });
    });

    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoad = false;
      });
    });
  }
}
