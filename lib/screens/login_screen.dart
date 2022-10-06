import 'package:flutter/material.dart';
import 'package:shared_preference/screens/register_screen.dart';

import '../local_data/storage.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String savedUsername = '';
  String savedPassword = '';
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    getInitials();
    super.initState();
  }

  void getInitials() {
    savedPassword = StorageRepository.getString("password");
    print("savedPasword:$savedPassword");
    savedUsername = StorageRepository.getString("username");
    print("savedUsername:$savedUsername");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 150,),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  hintText: "Username",
                  hintStyle: TextStyle(color: Colors.black38),

                ),
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 55,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.black38),

                ),
              ),
            ),
            SizedBox(height: 20,),

            TextButton(
              onPressed: () async {
                String username = usernameController.text;
                String password = passwordController.text;
                if (username.length > 3 && password.length > 6) {
                  if (username == savedUsername && password == savedPassword) {
                    await StorageRepository.putBool("isLogged", true);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                          return HomeScreen();
                        }));
                  } else {
                    //message
                  }
                } else {
                  //message
                }
              },
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return RegisterScreen();
                      }));
                },
                child: Text("Create account"))
          ],
        ),
      ),
    );
  }
}