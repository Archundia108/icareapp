import 'package:flutter/cupertino.dart';
import 'package:icareapp/model/lesson_category.dart';
import 'package:icareapp/model/section.dart';
import 'dart:convert';

class LessonUser {
  String? id;
  String idUsuario;
  String idLesson;

  LessonUser({
    this.id,
    required this.idUsuario,
    required this.idLesson,
  });

  factory LessonUser.fromJson(String str) => LessonUser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LessonUser.fromMap(Map<String, dynamic> json) => LessonUser(
        idUsuario: json["idUsuario"],
        idLesson: json["idLesson"],
      );

  Map<String, dynamic> toMap() => {
        "idUsuario": idUsuario,
        "idLesson": idLesson,
      };

  LessonUser copy() => LessonUser(
        idUsuario: this.idUsuario,
        idLesson: this.idLesson,
        id: this.id,
      );
}
