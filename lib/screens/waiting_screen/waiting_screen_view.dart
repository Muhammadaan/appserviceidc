import 'package:flutter/material.dart';
import 'package:tokokita/utils/style.dart';
import './waiting_screen_view_model.dart';

class WaitingScreenView extends WaitingScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Waiting"),
      ),
      body: isLoad
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(mainColor),
                ),
              ),
            )
          : Container(
              child: waitingStatus == 1
                  ? Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 200,
                          ),
                          Image.asset(waitImg),
                          Text("Waiting Payment")
                        ],
                      ),
                    )
                  : Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [Text("Detail Order")],
                      ),
                    ),
            ),
    );
  }
}
