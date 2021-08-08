import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_string_save/pages/home_page.dart';
import 'package:hive_string_save/pages/signup_page.dart';
import 'package:hive_string_save/services/db_service.dart';
class LoginPage extends StatefulWidget {
  static final String id = "login_page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  _doLogin() async {
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    UserDBString userDBString = new UserDBString();
    userDBString.storeUser(username, password); // savedata
    List list = userDBString.loadUser(); // loaddata

    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new HomePage(username: list[0], password: list[1],fromLoginPage: true,);
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
              SizedBox(height: 120,),
              // #avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage("assets/images/avatar.jpg")
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),

              Text("Welcome Back!", style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Text("Sign in to continue", style: TextStyle(color: Colors.white, fontSize: 18),),
              SizedBox(height: 30,),

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
              SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.lock, color: Colors.white70),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white70),
                    fillColor: Colors.white,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.white
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.white70
                        )
                    )
                ),
              ),
              SizedBox(height: 15,),

              TextButton(
                onPressed: (){},
                child: Text("Forget password?", style: TextStyle(color: Colors.white70, letterSpacing: 1),),
              ),
              SizedBox(height: 30,),

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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  onPressed: (){
                    _doLogin();
                  },
                  child: Icon(Icons.arrow_forward, color: Colors.white, size: 34,),
                ),
              ),
              SizedBox(height: 100,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: Colors.white70, fontSize: 16, letterSpacing: 1),),
                  TextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, SignupPage.id);
                    },
                    child: Text("SIGN UP", style: TextStyle(fontSize: 16, letterSpacing: 1),),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}





