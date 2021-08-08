import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_string_save/pages/home_page.dart';
import 'package:hive_string_save/services/db_service.dart';

import 'login_page.dart';
class SignupPage extends StatefulWidget {
  static final String id = "signup_page";
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  void _doSignUp() async {

    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();

    AccountDBString accountDBString = AccountDBString();
    accountDBString.storeUser(username, email, phone, password);

    List list = accountDBString.loadUser();

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context){
          return HomePage.account(username: list[0], email: list[1], phone: list[2], password: list[3],fromLoginPage: false,);
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 35, 58),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create", style: TextStyle(color: Colors.white, fontSize: 32, letterSpacing: 1),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Account", style: TextStyle(color: Colors.white, fontSize: 32, letterSpacing: 1),),
                ],
              ),
              SizedBox(height: 30,),
              // #username
              TextField(
                controller: usernameController,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.person, color: Colors.white70,),
                  hintText: "User Name",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white70
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
              // #email
              TextField(
                controller: emailController,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.mail, color: Colors.white70,),
                  hintText: "E-Mail",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white70
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
              // #phone
              TextField(
                controller: phoneController,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.phone, color: Colors.white70,),
                  hintText: "Phone Number",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white70
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
              // #password
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(CupertinoIcons.lock, color: Colors.white70,),
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.white70),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white70
                      )
                  ),
                ),
              ),
              SizedBox(height: 60,),
              // #button
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        colors: [
                          Colors.blue.shade700,
                          Colors.blue.shade600,
                          Colors.blue.shade500,
                          Colors.lightBlueAccent
                        ]
                    )
                ),
                child: MaterialButton(
                  //color: Colors.blue.shade600,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  onPressed: (){
                    _doSignUp();
                  },
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 34,),
                ),
              ),
              SizedBox(height: 100,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 1),),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, LoginPage.id);
                    },
                    child: Text("SIGN IN", style: TextStyle(fontSize: 16, letterSpacing: 1),),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}








