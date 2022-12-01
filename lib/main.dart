import 'package:flutter/material.dart';
import 'package:icareapp/arguments/lesson_argument.dart';
import 'package:icareapp/pages/lessons/lesson_details.dart';
import 'package:icareapp/pages/lessons/lessons_list.dart';
import 'package:icareapp/pages/home_page.dart';
import 'package:icareapp/pages/login_screen.dart';
import 'package:icareapp/pages/register_page.dart';
import 'package:icareapp/services/auth_service.dart';
import 'package:icareapp/services/lecture_service.dart';
import 'package:icareapp/services/lesson_service.dart';
import 'package:icareapp/services/section_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LessonService(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthService(),
        ),
        ChangeNotifierProvider(
          create: (context) => SectionService(),
        ),
        ChangeNotifierProvider(
          create: (context) => LectureService(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iCare course',
      initialRoute: "home",
      routes: {
        "intro": (_) => LoginPage(),
        "home": (_) => HomePage(),
        "mylessons": (_) => MyLessons(),
        "register": (_) => RegisterPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == "lessonDetails") {
          final args = settings.arguments as LessonArgument;
          return MaterialPageRoute(
              builder: (context) => LessonDetails(
                    lesson: args.lesson,
                    //section: args.section,
                    //lecture: args.lecture,
                  ));
        }
      },
    );
  }
}
