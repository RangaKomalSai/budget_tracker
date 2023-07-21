// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'add_expenses.dart';


class DropDown extends StatefulWidget {
  const DropDown({
    required this.data,
    required this.hint,
    Key? key,
  }) : super(key: key);
  final List<String> data;
  final String hint;
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? _chosenValue1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(0.0),
        child: DropdownButton<String>(
          iconSize: 30,
          isExpanded: true,
          value: _chosenValue1,

          //elevation: 5,
          items: widget.data.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          hint: Text(
            widget.hint,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _chosenValue1 = value;
            });
          },
        ),
      ),
    );
  }
}
// class DropDownMenu extends StatefulWidget {
//   const DropDownMenu({super.key});
//
//   @override
//   State<DropDownMenu> createState() => _DropDownMenuState();
// }
//
// class _DropDownMenuState extends State<DropDownMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButton(
//         items: ,
//         onChanged: onChanged
//     );
//   }
// }



