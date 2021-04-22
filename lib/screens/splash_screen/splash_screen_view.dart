import 'package:flutter/material.dart';
import 'package:tokokita/utils/style.dart';
import './splash_screen_view_model.dart';

class SplashScreenView extends SplashScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(logoImg),
            SizedBox(
              height: 10,
            ),
            Text("Loading ..")
          ],
        ),
      ),
    );
  }
}
