import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_string_save/pages/home_page.dart';
import 'package:hive_string_save/pages/login_page.dart';
import 'package:hive_string_save/pages/signup_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("user");
  await Hive.openBox("account");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: {
        SignupPage.id: (context) => SignupPage(),
        LoginPage.id: (context) => LoginPage(),
        HomePage.id: (context) => HomePage()
      },
    );
  }
}