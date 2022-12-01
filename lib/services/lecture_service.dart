import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/section.dart';

class LectureService extends ChangeNotifier {
  final String _baseUrl = 'icareapp-12-default-rtdb.firebaseio.com';

  final List<Lecture> lectures = [];

  LectureService() {
    this.obtainLectures();
  }

  Future obtainLectures() async {
    notifyListeners();

    final urlLectures = Uri.https(_baseUrl, 'lectures.json');
    final respLectures = await http.get(urlLectures);

    final Map<String, dynamic> lecturesMap = json.decode(respLectures.body);

    lecturesMap.forEach((key, value) {
      final lectureTemp = Lecture.fromMap(value);
      lectureTemp.lectureId = key;

      this.lectures.add(lectureTemp);
    });

    notifyListeners();
    return this.lectures;
  }
}
