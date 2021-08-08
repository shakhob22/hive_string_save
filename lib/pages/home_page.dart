import 'package:flutter/material.dart';
import 'package:hive_string_save/pages/login_page.dart';
import 'package:hive_string_save/services/db_service.dart';

class HomePage extends StatefulWidget {
  static final id = "home_page";
   String? username;
   String? email;
   String? phone;
   String? password;
   bool? fromLoginPage;
   HomePage({this.username, this.password, this.fromLoginPage});
   HomePage.account({this.username, this.password, this.email, this.phone, this.fromLoginPage});

  var account = AccountDBString();
  var user = UserDBString();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              widget.fromLoginPage! ?
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("User name: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("Password: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.username!, style: TextStyle(fontSize: 24),),
                      Text(widget.password!, style: TextStyle(fontSize: 24),),
                    ],
                  )
                ],
              ) :
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("User name: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("email: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("phone: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                      Text("Password: ", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
                    ],
                  ),
                  SizedBox(width: 5,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.username!, style: TextStyle(fontSize: 24),),
                      Text(widget.email!, style: TextStyle(fontSize: 24),),
                      Text(widget.phone!, style: TextStyle(fontSize: 24),),
                      Text(widget.password!, style: TextStyle(fontSize: 24),),
                    ],
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          MaterialButton(
            onPressed: (){
              widget.account.removeAccount();
              widget.user.removeUser();
              Navigator.pushReplacementNamed(context, LoginPage.id);
            },
            color: Colors.red,
            child: Text("Log OUT", style: TextStyle(color: Colors.white, fontSize: 24),),
          )
        ],
      )
    );
  }
}
