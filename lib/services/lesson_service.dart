import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/lesson_user.dart';
import 'package:icareapp/model/section.dart';
import 'package:icareapp/pages/lessons/lessons_list.dart';

class LessonService extends ChangeNotifier {
  final String _baseUrl = 'icareapp-12-default-rtdb.firebaseio.com';

  final List<Lesson> lessons = [];
  final List<LessonUser> lessonsUser = [];
  final List<LessonUser> lessonsUserFiltered = [];  
  final List<Lesson> lessonsFiltered = [];  

  //final List<Section> sections = [];
  //final List<Lecture> lectures = [];

  String idUsuario = "";

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

  Future obtainLessonsUser() async {
    notifyListeners();
    this.lessonsUser.clear();
    final urlLessons = Uri.https(_baseUrl, 'lessonsUser.json');
    final respLesson = await http.get(urlLessons);
    if (json.decode(respLesson.body) == null) {
      notifyListeners();
      return [];
    }

    final Map<String, dynamic> lessonsMap = json.decode(respLesson.body);

    lessonsMap.forEach((key, value) {
      final lessonTemp = LessonUser.fromMap(value);
      lessonTemp.id = key;

      this.lessonsUser.add(lessonTemp);
    });

    notifyListeners();
    return this.lessonsUser;
  }

  Future filterLessonsByUserID() async {
    var contain = this.lessonsUser.where(
        (element) => element.idUsuario == this.idUsuario);
      // print(contain);
    this.lessonsUserFiltered.clear();
    contain.forEach((element) {
      this.lessonsUserFiltered.add(element);
    });

    this.lessonsFiltered.clear();
    lessonsUserFiltered.forEach((elementLessonUser) {
      var contain = this.lessons.where(
          (element) => element.id == elementLessonUser.idLesson);  
      contain.forEach((element) {
        this.lessonsFiltered.add(element);
      });          
    });

  }
  Future agregarLesson(String id) async {
    print("ID Lesson:"+id);
    print("idUsuario: "+this.idUsuario);
    // isSaving = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, "lessonsUser.json");
    final myJSON = '{"idUsuario":"${this.idUsuario}","idLesson":"$id"}';
    final resp = await http.post(url, body: myJSON);
    final decodedData = json.decode(resp.body);
    print(decodedData["name"]);
    // institucion.id = decodedData["name"];
    // this.instituciones.add(institucion);
    // this.resultados.add(institucion);
    // this.institucionesGuest.add(institucion);
    // this.resultadosGuest.add(institucion);    
    // isSaving = false;
    notifyListeners();
    // return institucion.id!;    
    return 'ok';
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
