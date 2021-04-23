import 'package:flutter/material.dart';
import './dashboard_screen_view_model.dart';

class DashboardScreenView extends DashboardScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        child: Column(
          children: [Text("aa")],
        ),
      ),
    );
  }
}
