import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerEmail=TextEditingController();
  final TextEditingController _controllerName=TextEditingController();
  bool isActive=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login App"),),
      body: Column(
        children: [
          TextFormField(
            onTap: (){
              setState((){
                isActive=true;
              });
            },
            decoration: const InputDecoration(
              hintText: "Emailni kiriting",
            ),
            controller: _controllerEmail,
          ),
          TextFormField(
            onTap: (){
              setState((){
                isActive=true;
              });
            },
            decoration: InputDecoration(
              hintText: "Ismingizni kiriting"
            ),
            controller: _controllerName,
          ),
          ElevatedButton(onPressed: (){
            print(GetStorage().read('email'));
          }, child: Text("Isbotala")),
          SizedBox(
            child: isActive ? Column(
              children: [
                Text(GetStorage().read('email')),
                Text(GetStorage().read('name')),
              ],
            ): null
          )
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async{
          await GetStorage().write('email', _controllerEmail.text);
          await GetStorage().write('name', _controllerName.text);


        },
        child: Text("Saqla"),
      ),
    );
  }
}
