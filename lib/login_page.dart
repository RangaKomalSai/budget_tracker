// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/signup_page.dart';

import 'main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final pswdController = TextEditingController();
  bool _isLoading = false;

  Future signIn() async{
    final isValid = formKey.currentState!.validate();
    if(!isValid)return;

    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pswdController.text.trim()
      );
    } catch (e){
      print('error in: $e');
      Utils.showSnackBar(e.toString());
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    pswdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 100,),
                    Text(
                      'LOGIN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 35
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            prefixIcon: Icon(Icons.email_rounded),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Color.fromRGBO(47, 37, 245, 1), width: 2)
                            ),
                            fillColor: Colors.grey[100],
                            filled: true
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) => email != null && !EmailValidator.validate(email)? 'Enter a valid email' : null,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        controller: pswdController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: Icon(Icons.visibility_rounded),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Colors.white)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(21),
                                borderSide: BorderSide(color: Color.fromRGBO(47, 37, 245, 1), width: 2)
                            ),
                            fillColor: Colors.grey[100],
                            filled: true
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6 ? 'Enter min. 6 characters' : null,
                      ),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: GestureDetector(
                        onTap: signIn,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(47, 37, 245, 1),
                              borderRadius: BorderRadius.circular(25)
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500,fontSize: 25),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width * 0.35,
                            color: Colors.grey,
                          ),
                          Text(
                            ' OR ',
                            style: TextStyle(
                                fontSize: 16
                            ),
                          ),
                          Container(
                            height: 3,
                            width: MediaQuery.of(context).size.width * 0.35,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/google.jpg'),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                              fontSize: 16
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()),
                            );
                          },
                          child: Text(
                            ' Create Now',
                            style: TextStyle(
                                color: Color.fromRGBO(47, 37, 245, 1),
                                fontWeight: FontWeight.w800,
                                fontSize: 16
                            ),
                          ),
                        )
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
final messengerKey = GlobalKey<ScaffoldMessengerState>();
class Utils{
  static final GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text){

    if(text == null){return;}
    final snackBar = SnackBar(content: Text(text), backgroundColor: Colors.grey[900],);

    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackBar);
  }
}