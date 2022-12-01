import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/section.dart';

class LessonService extends ChangeNotifier {
  final String _baseUrl = 'icareapp-12-default-rtdb.firebaseio.com';

  final List<Lesson> lessons = [];
  //final List<Section> sections = [];
  //final List<Lecture> lectures = [];

  LessonService() {
    this.obtainLessons();
  }

  Future obtainLessons() async {
    notifyListeners();

    final urlLessons = Uri.https(_baseUrl, 'lessons.json');
    final respLesson = await http.get(urlLessons);

    final Map<String, dynamic> lessonsMap = json.decode(respLesson.body);

    lessonsMap.forEach((key, value) {
      final lessonTemp = Lesson.fromMap(value);
      lessonTemp.id = key;

      this.lessons.add(lessonTemp);
    });

    notifyListeners();
    return this.lessons;
  }

  // Future obtainSections() async {
  //   notifyListeners();

  //   final urlSections = Uri.https(_baseUrl, 'sections.json');
  //   final respSections = await http.get(urlSections);

  //   final Map<String, dynamic> sectionsMap = json.decode(respSections.body);

  //   sectionsMap.forEach((key, value) {
  //     final sectionTemp = Section.fromMap(value);
  //     sectionTemp.sectionId = key;

  //     this.sections.add(sectionTemp);
  //   });

  //   notifyListeners();
  //   return this.sections;
  // }

  // Future obtainLectures() async {
  //   notifyListeners();

  //   final urlLectures = Uri.https(_baseUrl, 'lectures.json');
  //   final respLectures = await http.get(urlLectures);

  //   final Map<String, dynamic> lecturesMap = json.decode(respLectures.body);

  //   lecturesMap.forEach((key, value) {
  //     final lectureTemp = Lecture.fromMap(value);
  //     lectureTemp.lectureId = key;

  //     this.lectures.add(lectureTemp);
  //   });

  //   notifyListeners();
  //   return this.lectures;
  // }
}
