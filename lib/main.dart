// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
        fontFamily: 'IndieFlower'
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
  double r = 150.0;
  double expensesTotal = 0;
  bool visibleList = false;
  IconData showIcon1 = Icons.keyboard_double_arrow_down_rounded;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Budget  Tracker',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 4.0,
            fontFamily: 'IndieFlower',
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
              radius: r,
            ),
            SizedBox(height: 10.0),
            Text(
              'Welcome, $name!',
              style: TextStyle(
              fontSize: 30.0,
              letterSpacing: 4.0,
            ),
            ),
            Container(
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
                    '$expensesTotal',
                    style: TextStyle(
                      fontSize: 55.0,
                      fontFamily: 'IndieFlower',
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: (){setState(() {
                          visibleList = !visibleList;
                          if(visibleList == true){showIcon1 = Icons.keyboard_double_arrow_up_rounded; r = 50.0;}
                          else {showIcon1 = Icons.keyboard_double_arrow_down_rounded; r = 150.0;}
                        });},
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.0),
                          ),
                          child: Icon(
                            showIcon1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.black,
        child: Icon(Icons.add),

      ),
    );
  }
}
