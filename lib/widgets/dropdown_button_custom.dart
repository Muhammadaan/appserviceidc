import 'package:flutter/material.dart';
import 'package:tokokita/utils/app_helper.dart';
import 'package:tokokita/utils/app_style.dart';

class DropdownCustom extends StatefulWidget {
  final String title;
  final String hint;
  final dynamic initialValue;
  final String childKey;
  final String valueKey;
  final bool isRequired;
  final bool isEnabled;
  final bool isTitleBold;
  final List<dynamic> listData;
  final ValueChanged<dynamic> onResult;

  const DropdownCustom({
    Key key,
    @required this.title,
    @required this.hint,
    @required this.initialValue,
    @required this.listData,
    @required this.childKey,
    @required this.valueKey,
    @required this.isRequired,
    @required this.onResult,
    this.isEnabled = true,
    this.isTitleBold = false,
  }) : super(key: key);

  @override
  _DropdownCustomState createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: !AppHelper.isNullOrEmptyString(widget.title),
          child: Container(
            margin: EdgeInsets.only(left: 2, bottom: 10),
            child: Row(
              children: [
                FittedBox(
                    fit: BoxFit.cover,
                    child: Text(widget.title,
                        style: widget.isTitleBold
                            ? boldTextStyle(14, Colors.black)
                            : lightTextStyle(12, Colors.black))),
                widget.isRequired
                    ? Text("*", style: boldTextStyle(12, Colors.red))
                    : Container()
              ],
            ),
          ),
        ),
        DropdownButtonFormField(
          isExpanded: true,
          isDense: true,
          hint: Text(
            widget.hint,
            style: lightTextStyle(12, Colors.black),
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.isEnabled ? Colors.white : Colors.grey,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
          value: widget.initialValue,
          items: widget.listData.map((item) {
            return DropdownMenuItem<dynamic>(
                child: Text(
                  item[widget.valueKey],
                  overflow: TextOverflow.ellipsis,
                  style: lightTextStyle(12, Colors.black),
                ),
                value: item);
          }).toList(),
          onChanged: (value) {
            widget.onResult(value);
          },
        ),
      ],
    ));
  }
}
