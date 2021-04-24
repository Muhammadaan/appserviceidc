import 'package:flutter/material.dart';
import 'package:tokokita/screens/order_screen/order_screen.dart';
import 'package:tokokita/utils/global_method_helper.dart';
import 'package:tokokita/utils/style.dart';
import './list_package_screen_view_model.dart';

class ListPackageScreenView extends ListPackageScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    //

    return Scaffold(
      appBar: AppBar(
        title: Text("List Package"),
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
                        child: Text(
                          "List Package",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Column(
                        children: packageListResponse.data.map((e) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    e.imageUrl,
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.packageName,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        GlobalMethodHelper.formatNumberToString(
                                            e.priceMax),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 90, child: Text("Quantity ")),
                                  Container(
                                    width: 100,
                                    child: TextField(
                                      controller: ctrlListQuantity[
                                          packageListResponse.data.indexOf(e)],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10.0),
                                        border: new OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  SizedBox(width: 90, child: Text("Comment  ")),
                                  Expanded(
                                    child: Container(
                                      child: TextField(
                                        controller: ctrlListComment[
                                            packageListResponse.data
                                                .indexOf(e)],
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: new OutlineInputBorder(
                                              borderSide: new BorderSide(
                                                  color: Colors.teal)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList()),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: TextButton(
                        onPressed: () {
                          toNextPage();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => OrderScreen(),
                          //   ),
                          // );
                        },
                        child: Text("Next"),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: mainColor,
                            onSurface: Colors.grey,
                            minimumSize: Size(double.infinity, 50)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
