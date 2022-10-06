import 'package:flutter/material.dart';
import 'package:shared_preference/bottom_screens/courses.dart';
import 'package:shared_preference/bottom_screens/profile.dart';
import 'package:shared_preference/bottom_screens/settings.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;


  List<Widget> screens = [
    Courses(),
    Profile(),
    Settings()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          print(index);
        },
        currentIndex: currentIndex,

        items: [

          getItem(icon: Icons.perm_data_setting_sharp, labelText: "Courses"),
          getItem(icon: Icons.person, labelText: "Profile"),
          getItem(icon: Icons.settings, labelText: "Settings"),
        ],
      ),

    );
  }
  BottomNavigationBarItem getItem(
      {required IconData icon, required String labelText}) {
    return BottomNavigationBarItem(
        label: labelText,
        icon: Icon(icon),
        activeIcon: Icon(
          icon,
          color: Colors.blue,
        ));
  }
}