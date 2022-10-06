import 'package:flutter/material.dart';
import 'package:shared_preference/screens/login_screen.dart';
class Notif extends StatefulWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {
  int currentPageIndex=0;
  String buttonText="Next";
  PageController controller=PageController(initialPage: 0);
  List<Widget>screens=[
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
         Image.asset("assets/images/img.png"),
        //Lottie.asset("assets/lottie/splash1.json"),
        SizedBox(height: 15,),
        Text("Learn anytime \n and anywhere", style: TextStyle(fontSize: 20, color: Colors.black),),
        Text("Quarantine is the perfect time to spend your\nday learning something new, from anywhere!", style: TextStyle(color: Colors.black, fontSize: 14),)
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/images/img_1.png"),
        SizedBox(height: 15,),
        Text("Find a course\nfor you",textAlign: TextAlign.center, style: TextStyle(fontSize: 20, color: Colors.black),),
        Text("Quarantine is the perfect time to spend your\nday learning something new, from anywhere!", style: TextStyle(color: Colors.black, fontSize: 14),)
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset("assets/images/img_2.png"),
        SizedBox(height: 15,),
        Text("Improve your skills", style: TextStyle(fontSize: 20, color: Colors.black),),
        Text("Quarantine is the perfect time to spend your\nday learning something new, from anywhere!", style: TextStyle(color: Colors.black, fontSize: 14),)
      ],
    ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notification"),),
      body: Column(
        children: [
          Expanded(child: PageView(
            onPageChanged: (pageIndex){

            },
            controller: controller,
            children: screens,
          )),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                color: currentPageIndex == 0 ? Colors.blueAccent : Colors.pink,
                width: currentPageIndex == 0 ? 20 : 10,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 10,
                color: currentPageIndex == 1 ? Colors.blueAccent : Colors.pink,
                width: currentPageIndex == 1 ? 20 : 10,
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 10,
                color: currentPageIndex == 2 ? Colors.blueAccent : Colors.pink,
                width: currentPageIndex == 2 ? 20 : 10,
              )
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 65,
            width: 280,
            decoration:BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(16)
            ),
            child: TextButton(onPressed: (){
              setState((){
                if (currentPageIndex < 2) {
                  currentPageIndex++;
                  controller.jumpToPage(currentPageIndex);
                } else {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (BuildContext c) {
                        return LoginScreen();
                      }));
                }
                if (currentPageIndex == 2) {
                  buttonText = "Let's start";
                }
              });
            }, child: Center(child: Text(buttonText, style: TextStyle(color: Colors.white,fontSize: 20),),)),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
