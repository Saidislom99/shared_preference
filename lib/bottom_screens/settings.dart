import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../local_data/storage.dart';
import '../notif_screen/notif.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text("Settings", style:TextStyle(fontSize: 20, color: Colors.black),

      ),
        ),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ClipRRect(
              child:Image.asset("assets/images/set.png", height: 300, width: 300,)
              ,
            ),
          ),
          InkWell(
            onTap: (){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Notif();
                  }));
            },
            child: Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.access_time_filled_rounded, size: 35, color: Colors.blue, ),
                  Text("Notifications", style: TextStyle(fontSize: 20, color: Colors.black),),
                ],
              ),

            ),
          ),
          SizedBox(height: 15,),
          Row(
            children: [
              SizedBox(width: 35,),
              Text("Account information", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700, color: Colors.black),),
            ],
          ),
          Container(
            width: 320,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.person, size: 35, color: Colors.blue, ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Name", style: TextStyle(fontSize: 22, color: Colors.black),),
                    Text(StorageRepository.getString("username"), )
                  ],
                )
              ],
            ),

          ),
          SizedBox(height: 8,),
          Container(
            width: 320,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black,width: 1),
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.sms, size: 35, color: Colors.blue, ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Email", style: TextStyle(fontSize: 22, color: Colors.black),),
                    Text(StorageRepository.getString("age"), )
                  ],
                )
              ],
            ),

          ),
          SizedBox(height: 8,),
          Container(
            width: 320,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.lock, size: 35, color: Colors.blue, ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Password", style: TextStyle(fontSize: 22, color: Colors.black),),
                    Text(StorageRepository.getString("password"), )
                  ],
                )
              ],
            ),

          ),



        ],
      ),
    );
  }
}
