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
        width: MediaQuery.of(context).size.width * 0.85,
        padding: const EdgeInsets.all(0.0),
        child: DropdownButton<String>(
          iconSize: 30,
          isExpanded: true,
          value: _chosenValue1,

          //elevation: 5,
          items: widget.data.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                  value,
                style: TextStyle(
                  fontFamily: 'Ubuntu'
                ),
              ),
            );
          }).toList(),
          hint: Text(
            widget.hint,
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 13,
              fontWeight: FontWeight.w800,
              fontFamily: 'Ubuntu',
              letterSpacing: 1,
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

class NewCard extends StatefulWidget {
  const NewCard({
    required this.amount,
    required this.description,
    Key? key,
  }) : super(key: key);

  final String amount;
  final String description;

  @override
  State<NewCard> createState() => _NewCardState();
}

class _NewCardState extends State<NewCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 70.0,
            width: MediaQuery.of(context).size.width,
            child : Card(
              elevation: 0.0,
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(28, 10, 28, 0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Sets a border radius of 10.0
              ),
              child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w100
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.black,
                          size: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                          child: Text(
                            NumberFormat.decimalPattern().format(int.parse(widget.amount)),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 10, 0),
            child: Container(
              height: 55.0,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black,
              ),
              child: IconButton(
                onPressed: (){
                  // int index = cards.indexOf(this);
                  // removeCard();
                },
                icon: Icon(Icons.delete_rounded, size: 28, color: Colors.white,),
              ),
            ),
          ),
          // SizedBox(width: 10,)
        ],
      ),
    );
  }
}
