// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'main.dart';

class AddExpense extends StatefulWidget {
  final Function(String, String) onCreateContainer;
  AddExpense({required this.onCreateContainer});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        backgroundColor: Colors.white,
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
              style: TextStyle(fontFamily: 'IndieFlower',
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller: amountController,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Amount',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                controller: descriptionController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
                onEditingComplete: (){
                  widget.onCreateContainer(amountController.text, descriptionController.text);
                  Navigator.pop(context);
                },
              ),
            ),
            ElevatedButton(
              onPressed: (){
                widget.onCreateContainer(amountController.text, descriptionController.text);
                Navigator.pop(context);
              },
              child: Text('Done'),
            ),
          ],
        ),
      ),
    );
  }
}
