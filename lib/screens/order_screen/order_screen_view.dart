import 'package:flutter/material.dart';
import 'package:tokokita/utils/style.dart';
import 'package:tokokita/widgets/dropdown_button_custom.dart';
import './order_screen_view_model.dart';

class OrderScreenView extends OrderScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Order"),
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
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextInput(
                            label: "Address",
                            ctrl: addressCtrl,
                            typeinput: TextInputType.text),
                        TextInput(
                            label: "Address Note",
                            ctrl: addressNoteCtrl,
                            typeinput: TextInputType.text),
                        TextInput(
                            label: "Latitude",
                            ctrl: latitudeCtrl,
                            typeinput: TextInputType.number),
                        TextInput(
                            label: "Longtitude",
                            ctrl: longtitudeCtrl,
                            typeinput: TextInputType.number),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Domisili"),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownCustom(
                          title: "",
                          hint: "Status",
                          initialValue: listDomisili != null
                              ? listDomisili.singleWhere(
                                  (e) => e['nama'] == domisiliName,
                                  orElse: () => listDomisili.first)
                              : "",
                          childKey: "id",
                          valueKey: "nama",
                          listData: listDomisili != null ? listDomisili : [],
                          isRequired: false,
                          onResult: (value) {
                            setState(() {
                              domisiliId = value['id'];
                              domisiliName = value['nama'];
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Payment"),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownCustom(
                          title: "",
                          hint: "Status",
                          initialValue: listPayment != null
                              ? listPayment.singleWhere(
                                  (e) => e['nama'] == domisiliName,
                                  orElse: () => listPayment.first)
                              : "",
                          childKey: "id",
                          valueKey: "nama",
                          listData: listPayment != null ? listPayment : [],
                          isRequired: false,
                          onResult: (value) {
                            setState(() {
                              paymentId = value['id'];
                              paymentName = value['nama'];
                            });
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextButton(
                          onPressed: () {
                            order();
                          },
                          child: Text("Order"),
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: mainColor,
                              onSurface: Colors.grey,
                              minimumSize: Size(double.infinity, 50)),
                        ),
                      ],
                    ),
                  ),
                  if (isLoadPost)
                    Container(
                      height: height,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(mainColor),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Loading ..",
                            style: TextStyle(color: Colors.grey[700]),
                          )
                        ],
                      ),
                    )
                ],
              ),
            ),
    );
  }
}

class TextInput extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  final TextInputType typeinput;
  const TextInput({
    Key key,
    this.label,
    this.ctrl,
    this.typeinput,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          SizedBox(
            height: 5,
          ),
          TextField(
            controller: ctrl,
            keyboardType: typeinput,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.teal)),
            ),
          ),
        ],
      ),
    );
  }
}
