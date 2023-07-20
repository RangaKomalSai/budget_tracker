// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'add_expenses.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Tracker',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        scaffoldBackgroundColor: Colors.white
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = 'Name';
  String showStars = '***';
  double r = 130.0;
  int expensesTotal = 0;
  bool visibleList = false;
  bool introVisible = true;
  IconData showIcon1 = Icons.keyboard_double_arrow_down_rounded;
  List<Container> containers = [];

void createContainer(String amount, String description) {
  setState(() {
    containers.add(Container(

      width: MediaQuery.of(context).size.width,
      height: 70.0,
      margin: EdgeInsets.fromLTRB(28.0, 10.0, 28.0, 0.0),
      padding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.grey[200],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            description,
            style: TextStyle(
              fontSize: 30.0,
              // fontFamily: 'Roboto',
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
                Text(
                  NumberFormat.decimalPattern().format(int.parse(amount)),
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
    expensesTotal += int.parse(amount);
  });
}

  @override
  Widget build(BuildContext context) {

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Budget  Tracker',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
            fontFamily: 'Ubuntu',
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10.0),
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.jpg'),
                radius: r,
              ),
              SizedBox(height: 10.0),
              Visibility(
                visible: introVisible,
                child: Text(
                  'Welcome, $name!',
                  style: TextStyle(
                  fontSize: 30.0,
                  letterSpacing: 4.0,
                ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: deviceHeight * 0.2,
                width: deviceWidth,
                margin: EdgeInsets.fromLTRB(18.0, 0.0, 18.0, 0.0),
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 20.0, 0.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.black,
                ),
                child:Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      NumberFormat.decimalPattern().format(expensesTotal),
                      style: TextStyle(
                        fontSize: 35.0,
                        // fontFamily: 'IndieFlower',
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.0),
                          ),
                          child: IconButton(
                            onPressed:(){setState(() {
                              visibleList = !visibleList;
                              if(visibleList == true){showIcon1 = Icons.keyboard_double_arrow_up_rounded; r = 50.0; introVisible = false;}
                              else {showIcon1 = Icons.keyboard_double_arrow_down_rounded; r = 130.0; introVisible = true;}
                            });},
                            icon: Icon(showIcon1),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Visibility(
                visible: visibleList,
                child: Container(
                  height: deviceHeight * 0.4,
                  child: ListView.builder(
                    itemCount: containers.length,
                    itemBuilder: (context, index) {
                      return containers[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddExpense(onCreateContainer: createContainer))
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),

      ),
    );
  }
}
