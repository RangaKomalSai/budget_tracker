// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'main.dart';
import 'newcard.dart';
import 'card_list.dart';

const List<String> list = <String>['Income', 'Expense'];

class AddExpense extends StatefulWidget {
  final VoidCallback onPressedCallback;
  AddExpense({required this.onPressedCallback});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String selectedOption = 'Expense';


  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    void showAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter a value in the text field.'),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1.0,
        backgroundColor: Color.fromRGBO(222, 227, 227, 1),
        title: Row(
          children: [
            InkWell(
              onTap: (){Navigator.pop(context);},
              child: Tooltip(message: 'Back',
                child: Icon(
                  Icons.arrow_back_ios,
                  semanticLabel: 'Back',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Text(
              'Add Amount',
              style: TextStyle(fontFamily: 'Josfie',
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      body:
      Center(
        child: GestureDetector(
          onTap: () {
            // Remove focus from any active text fields when tapping outside
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Ubuntu'
                  ),
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  controller: amountController,
                  onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.currency_rupee,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                    labelText: 'Enter Amount',
                    floatingLabelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      fontFamily: 'Ubuntu'
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black,
                          width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(21),
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Ubuntu',
                    fontSize: 15,
                  ),
                  controller: descriptionController,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                    labelText: 'Description',
                    floatingLabelStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Ubuntu',
                      fontSize: 15,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                        width: 2.0
                      ),
                      borderRadius: BorderRadius.circular(21),
                    )
                  ),
                  onEditingComplete: (){
                    if(amountController.text.isEmpty || descriptionController.text.isEmpty){showAlertDialog(context);}
                    else{
                      NewCard(amount: amountController.text, description: descriptionController.text);
                      expensesTotal += int.parse(amountController.text);
                      Navigator.pop(context);}
                  },
                ),
              ),
              // SizedBox(height: 10,),
              DropDown(
                data: [
                  'Income', 'Expense'
                ],
                hint: 'Transaction Type',
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){ setState(() {
                  if(amountController.text.isEmpty || descriptionController.text.isEmpty){showAlertDialog(context);}
                  else{
                    cardList.add(MyCard(amount: amountController.text, description: descriptionController.text));
                    expensesTotal += int.parse(amountController.text);
                    widget.onPressedCallback;
                    Navigator.pop(context, 'result');}
                });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.0), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20)
                ),
                child: Text(
                    'Done',
                  style: TextStyle(

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
