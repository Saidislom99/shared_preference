import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../local_data/storage.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      body: SafeArea(
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset("assets/images/person.png", fit: BoxFit.cover,)),
            GestureDetector(
              onTap: (){},

              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text("Your Courses", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 19),),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text("Saved", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 19),),
              ),
            ),
            SizedBox(height: 15,),

            Container(
              height: 55,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Text("Payment", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black, fontSize: 19),),
              ),
            ),
            SizedBox(height: 5,),

            TextButton(
                onPressed: () async {
                  await StorageRepository.deleteBool("isLogged");
                  await StorageRepository.deleteString("username");
                  await StorageRepository.deleteString("password");
                  await StorageRepository.deleteString("age");
                  SystemNavigator.pop();
                },
                child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
