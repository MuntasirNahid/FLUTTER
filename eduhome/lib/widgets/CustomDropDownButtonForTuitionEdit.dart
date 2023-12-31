import 'package:ui_ux/constants/icon_constants.dart';
import 'package:ui_ux/constants/input_decoration.dart';
import 'package:flutter/material.dart';

class CustomDropDownButtonForPostTuition1 extends StatefulWidget {
  //const CustomDropDownButton({super.key});
  final List<DropdownMenuItem> items;
  //final IconData iconData;
  final String value;
  Function onChangeFunctionality;
  CustomDropDownButtonForPostTuition1(
      {super.key, required this.items,
      required this.value,
      required this.onChangeFunctionality});

  @override
  State<CustomDropDownButtonForPostTuition1> createState() =>
      _CustomDropDownButtonForPostTuition1State();
}

class _CustomDropDownButtonForPostTuition1State
    extends State<CustomDropDownButtonForPostTuition1> {
  String selectedValue = "";
  // get itemList => widget.items;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 42,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: 160,
      decoration: containerDecoration,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
            //  prefixIcon: Icon(widget.iconData),
            //   filled: true,
            border: InputBorder.none),
        hint: Text("Select"),
        // value: selectedValue,
        icon: Icon(
          arrowDropdown,
          color: Colors.grey[900],
        ),

        menuMaxHeight: 200,
        iconEnabledColor: Colors.grey[900],
        iconDisabledColor: Colors.grey[900],
        value: selectedValue == '' ? widget.value : selectedValue,
        style: TextStyle(color: Colors.black, fontSize: 15),
        borderRadius: BorderRadius.circular(30.0),
        iconSize: 24,

        //underline: SizedBox(),
        isExpanded: true,
        dropdownColor: Colors.grey[100],
        onChanged: (value) {
          widget.onChangeFunctionality(value);
        },
        items: widget.items,
      ),
    );
  }
}
