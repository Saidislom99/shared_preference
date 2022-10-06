import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preference/notif_screen/notif.dart';

import '../local_data/storage.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future<void> checkState() async {
    await Future.delayed(Duration(seconds: 5));
    await StorageRepository.getInstance();

    var isLogged = StorageRepository.getBool("isLogged");
    print("IS LOGGED:$isLogged");
    if (isLogged) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return HomeScreen();
          }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
            return Notif();
          }));
    }
  }

  @override
  void initState() {
    checkState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/splash1.json"),
      ),
    );
  }
}