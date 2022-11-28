import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:icareapp/model/lesson.dart';

class LessonService extends ChangeNotifier {
  final String _baseUrl = 'icareapp-12-default-rtdb.firebaseio.com';

  final List<Lesson> lessons = [];

  LessonService() {
    this.obtainLessons();
  }

  Future obtainLessons() async {
    notifyListeners();

    final url = Uri.https(_baseUrl, 'lessons.json');
    final resp = await http.get(url);

    final Map<String, dynamic> lessonsMap = json.decode(resp.body);

    lessonsMap.forEach((key, value) {
      final lessonTemp = Lesson.fromMap(value);
      lessonTemp.id = key;
      this.lessons.add(lessonTemp);
    });

    notifyListeners();
    return this.lessons;
  }
}
