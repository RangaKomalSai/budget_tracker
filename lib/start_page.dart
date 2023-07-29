import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/login_page.dart';
import 'package:tracker/main.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          } else if(snapshot.hasError){
            return const Center(child: Text('Something gone wrong! Please try again!'),);
          } else if(snapshot.hasData){
            return const Home();
          }
          else {return const LoginPage();}
         }
      ),
    );
  }
}
