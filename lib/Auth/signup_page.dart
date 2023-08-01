// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tracker/Auth/login_page.dart';

import '../main.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({super.key, required this.showLoginPage});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final pswdController = TextEditingController();
  final confirmPswdController = TextEditingController();
  bool _isLoading = false;

  Future signUp() async{
    setState(() {
      _isLoading = true;
    });
    if (pswdController.text.trim() != confirmPswdController.text.trim()) {
      Utils.showSnackBar("Passwords do not match.");
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: pswdController.text.trim()
      );
      addUserDetails(nameController.text.trim());
    }on FirebaseAuthException catch (ex){Utils.showSnackBar(ex.code.toString());}

    setState(() {
      _isLoading = false;
    });
  }

  Future addUserDetails(String name) async{
    await FirebaseFirestore.instance.collection('users').add({
      'Name': name
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    emailController.dispose();
    pswdController.dispose();
    confirmPswdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            iconSize: 30,
            color: Colors.black,
            onPressed: (){Navigator.pop(context);},
          ),
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SIGN UP',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        hintText: 'Your Name',
                        prefixIcon: Icon(Icons.person),
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
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
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
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: pswdController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Set a Password',
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
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: confirmPswdController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                  ),
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: GestureDetector(
                    onTap: signUp,
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
                          'Sign up',
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
                        width: MediaQuery.of(context).size.width * 0.3,
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
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Continue with ',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/google.jpg'),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a member?',
                      style: TextStyle(
                          fontSize: 18
                      ),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        ' Login',
                        style: TextStyle(
                            color: Color.fromRGBO(47, 37, 245, 1),
                            fontWeight: FontWeight.w800,
                            fontSize: 18
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
    );
  }
}
