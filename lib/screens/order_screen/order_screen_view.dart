import 'package:flutter/material.dart';
import 'package:tokokita/utils/style.dart';
import 'package:tokokita/widgets/dropdown_button_custom.dart';
import './order_screen_view_model.dart';

class OrderScreenView extends OrderScreenViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
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
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextInput(
                      label: "Address",
                      ctrl: addressCtrl,
                    ),
                    TextInput(
                      label: "Address Note",
                      ctrl: addressNoteCtrl,
                    ),
                    TextInput(
                      label: "Latitude",
                      ctrl: latitudeCtrl,
                    ),
                    TextInput(
                      label: "Longtitude",
                      ctrl: latitudeCtrl,
                    ),
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
                      onPressed: () {},
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
            ),
    );
  }
}

class TextInput extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  const TextInput({
    Key key,
    this.label,
    this.ctrl,
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
            keyboardType: TextInputType.number,
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
