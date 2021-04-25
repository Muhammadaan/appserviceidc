import 'package:flutter/material.dart';
import 'package:tokokita/screens/list_package_screen/list_package_screen.dart';
import 'package:tokokita/utils/style.dart';
import './dashboard_screen_view_model.dart';

class DashboardScreenView extends DashboardScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
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
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20))),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Halo $nama ",
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Text("$email  $hp")
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(Icons.logout),
                              onPressed: () {
                                logOut();
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          "Service",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Column(
                        children: serviceResponse.data.map((e) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListPackageScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                e.imageUrl,
                                width: 50,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                e.serviceName,
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList())
                  ],
                ),
              ),
            ),
    );
  }
}
