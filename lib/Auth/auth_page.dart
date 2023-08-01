import 'package:flutter/material.dart';
import 'package:tracker/Auth/login_page.dart';
import 'package:tracker/Auth/signup_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true; //initially showing login page

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return LoginPage(showSignupPage: toggleScreens);
    } else {
      return SignupPage(showLoginPage: toggleScreens);
    }
  }
}
