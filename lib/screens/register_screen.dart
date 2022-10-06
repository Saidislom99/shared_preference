import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preference/utils/utils.dart';

import '../local_data/storage.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController ageController = TextEditingController();


  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();


  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70,),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onSubmitted: (value){
                 MyUtils.fieldFocusChange(context, focusNode1, focusNode2) ;
                },
                focusNode: focusNode1,
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "username",
                  hintStyle: TextStyle(color: Colors.black38),

                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                onSubmitted: (value){
                  MyUtils.fieldFocusChange(context, focusNode2, focusNode3);
                },
                focusNode: focusNode2,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.black38),

                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                focusNode: focusNode3,
                onSubmitted: (value){
                  focusNode3.unfocus();
                },
                controller: ageController,
                decoration: InputDecoration(
                  hintText: "email",
                  hintStyle: TextStyle(color: Colors.black38),

                ),
              ),
            ),
            SizedBox(height: 20,),




            TextButton(
                onPressed: () async {
                  if (usernameController.text.length > 3 &&
                      passwordController.text.length > 6 &&
                      ageController.text.isNotEmpty) {
                    await StorageRepository.putString(
                        key: "username", value: usernameController.text);
                    await StorageRepository.putString(
                        key: "password", value: passwordController.text);
                    await StorageRepository.putString(
                        key: "age", value: ageController.text);
                  }
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return LoginScreen();
                      }));
                },
                child: Text("Create your account"))
          ],
        ),
      ),
    );
  }
}