import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/lesson_category.dart';
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/section.dart';

class LessonProvider {
  static List<Section> sectionList = [
    Section("Introduction", [
      Lecture("What is Quality objective?", "01:48 mins"),
    ]),
    Section("Quality Basics", [
      Lecture("What composes LRO?", "02:25 mins"),
      Lecture("KPI´s", "05:17 mins"),
      Lecture("SLA", "17:20 mins"),
    ]),
    Section("SR Lifecycle", [
      Lecture("L1 Work", "02:25 mins"),
      Lecture("L2 Work", "05:17 mins"),
    ]),
  ];

  //Course List
  static List<Lesson> lessonList = [
    Lesson(
        "1",
        "Quality Basics",
        "assets/lesson/basics.jpg",
        "//////////Lesson Description/////////////////",
        "01-Jan-2022",
        4.2,
        LessonCategory.basics,
        '2.5 Hours',
        15,
        sectionList),
    Lesson(
        "2",
        "L1-Work",
        "assets/lesson/l1work.jpg",
        "//////////Lesson Description/////////////////",
        "01-Apr-2022",
        4.5,
        LessonCategory.srstatus,
        '3 Hours',
        10,
        sectionList),
    Lesson(
        "3",
        "Critical cases",
        "assets/lesson/critical.jpg",
        "//////////Lesson Description/////////////////",
        "01-Mar-2022",
        5,
        LessonCategory.severity,
        '2.7 Hours',
        15,
        sectionList),
    Lesson(
        "4",
        "iCare Overview",
        "assets/lesson/platform.jpg",
        "//////////Lesson Description/////////////////",
        "01-Jan-2022",
        4,
        LessonCategory.platforms,
        '5 Hours',
        30,
        sectionList),
    Lesson(
        "5",
        "Communication",
        "assets/lesson/communic.jpg",
        "//////////Lesson Description/////////////////",
        "01-Jan-2022",
        4.5,
        LessonCategory.basics,
        '4.3 Hours',
        25,
        sectionList),
  ];
}
