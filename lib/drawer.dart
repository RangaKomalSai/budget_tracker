// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/Auth/login_page.dart';

import 'add_expenses.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Color.fromRGBO(27, 131, 129, 1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/avatar.jpg')
                        )
                      ),
                      height: 80,
                    ),
                    SizedBox(height: 15,),
                    Text(
                        'Hello, name!',
                      style: TextStyle(
                        fontSize: 25
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Total Income : ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                        color: Colors.green
                      ),
                    ),
                    Icon(Icons.currency_rupee_rounded, color: Colors.green,size: 18,),
                    Text(
                      '20000',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.green
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your Total Expense : ',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.red
                      ),
                    ),
                    Icon(Icons.currency_rupee_rounded, color: Colors.red,size: 18,),
                    Text(
                      '20000',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.red
                      ),
                    )
                  ],
                ),
              ),
              Expanded(child: DrawerList()),
            ],
          ),
        ),
    );
  }
}

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            ListTile(
              onTap: (){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AddExpense(
                  onPressedCallback: () {},)
                ),
                );
              },
              leading: Icon(Icons.add, color: Colors.grey[700],),
              title: Text(
                  'Add Transaction',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700]
                ),
              ),
              horizontalTitleGap: 1,
              titleAlignment: ListTileTitleAlignment.center,
            ),
            ListTile(
              leading: Icon(Icons.bar_chart_rounded, color: Colors.grey[700],),
              title: Text(
                'Statistics',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700]
                ),
              ),
              horizontalTitleGap: 1,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.star_rate_rounded, color: Colors.grey[700],),
              title: Text(
                'Rate App',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey[700]
                ),
              ),
              horizontalTitleGap: 1,
            ),
            ListTile(
              leading: Icon(Icons.share, color: Colors.grey[700],),
              title: Text(
                'Share App',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700]
                ),
              ),
              horizontalTitleGap: 1,
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded, color: Colors.grey[700],),
              title: Text(
                'About Us',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700]
                ),
              ),
              horizontalTitleGap: 1,
            ),
            ListTile(
              onTap: (){FirebaseAuth.instance.signOut();},
              leading: Icon(Icons.logout_rounded, color: Colors.grey[700],),
              title: Text(
                'Log out',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[700]
                ),
              ),
              horizontalTitleGap: 1,
            )
          ],
        ),
      ),
    );
  }
}

