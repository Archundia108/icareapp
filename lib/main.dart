import 'package:flutter/material.dart';
import 'package:icareapp/pages/lessons/lessons_list.dart';
import 'package:icareapp/pages/home_page.dart';
import 'package:icareapp/pages/login_screen.dart';
import 'package:icareapp/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iCare course',
      initialRoute: "intro",
      routes: {
        "intro": (_) => LoginPage(),
        "home": (_) => HomePage(),
        "mycourses": (_) => MyCourseList(),
        "register": (_) => RegisterPage()
      },
    );
  }
}
