// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_element, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'main.dart';
import 'drop_down.dart';
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
  final TextEditingController transactionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
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
            content: Text('Please enter a value in all the fields.'),
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 1.0,
          backgroundColor: Color.fromRGBO(47, 37, 245, 1),
          title: Row(
            children: [
              InkWell(
                onTap: (){Navigator.pop(context);},
                child: Tooltip(message: 'Back',
                  child: Icon(
                    Icons.arrow_back_ios,
                    semanticLabel: 'Back',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Text(
                'Add Amount',
                style: TextStyle(fontFamily: 'Josfie',
                  color: Colors.white,
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18,38,18,18),
                    child: TextField(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      controller: amountController,
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelText: 'Enter Amount',
                        labelStyle: TextStyle(
                          color: Colors.grey
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38),
                          borderRadius: BorderRadius.circular(21),
                        ),
                        prefixIcon: Icon(
                          Icons.currency_rupee,
                          color: Colors.black,
                        ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(21),
                        //   borderSide: BorderSide(color: Colors.white)
                        // ),
                        floatingLabelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(47, 37, 245, 1),
                          fontFamily: 'Ubuntu',
                          fontSize: 18
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(47, 37, 245, 1),
                              width: 2.0
                          ),
                          borderRadius: BorderRadius.circular(21),
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18,38,18,18),
                    child: TextField(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                      ),
                      keyboardType: TextInputType.none,
                      controller: categoryController,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          labelText: 'Select Category',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                            borderRadius: BorderRadius.circular(21),
                          ),
                          floatingLabelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(47, 37, 245, 1),
                              fontFamily: 'Ubuntu',
                              fontSize: 18
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(47, 37, 245, 1),
                                width: 2.0
                            ),
                            borderRadius: BorderRadius.circular(21),
                          ),
                        suffixIcon: IconButton(
                            icon: Icon(Icons.expand_circle_down_outlined, size: 30,),
                          onPressed: (){print('pressed!!');},
                        )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18,14,18,18),
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                        fontSize: 16,
                      ),
                      controller: descriptionController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          fillColor: Colors.grey[200],
                          filled: true,
                          labelText: 'Description',
                          labelStyle: TextStyle(
                              color: Colors.grey
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                            borderRadius: BorderRadius.circular(21),
                          ),
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(21),
                        // ),
                        floatingLabelStyle: TextStyle(
                            color: Color.fromRGBO(47, 37, 245, 1),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                          fontSize: 18,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(47, 37, 245, 1),
                            width: 2.0
                          ),
                          borderRadius: BorderRadius.circular(21),
                        )
                      ),
                      onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  // SizedBox(height: 10,),
                  DropDown(
                    data: [
                      'Income', 'Expense'
                    ],
                    hint: 'Transaction Type',
                    textEditingController: transactionController,
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: (){ setState(() {
                      if(amountController.text.isEmpty || descriptionController.text.isEmpty || transactionController.text.isEmpty){showAlertDialog(context);}
                      else{
                        if(transactionController.text == 'Income'){
                          plusOrMinus = true;
                          cardList.add(MyCard(amount: amountController.text, description: descriptionController.text, transaction: plusOrMinus, posOrNeg: true,));
                          expensesTotal += int.parse(amountController.text);
                        }
                        else{
                          plusOrMinus = false;
                          cardList.add(MyCard(amount: amountController.text, description: descriptionController.text, transaction: plusOrMinus, posOrNeg: false,));
                          expensesTotal -= int.parse(amountController.text);
                        }
                        widget.onPressedCallback;
                        Navigator.pop(context, 'result');}
                    });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(47, 37, 245, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(21.0), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40)
                    ),
                    child: Text(
                        'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
