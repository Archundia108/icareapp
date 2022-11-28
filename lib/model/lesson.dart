import 'package:flutter/cupertino.dart';
import 'package:icareapp/model/lesson_category.dart';
import 'package:icareapp/model/section.dart';
import 'dart:convert';

class Lesson {
  String? id;
  String title;
  String thumbnailUrl;
  String description;
  String createdDate;
  double rate;
  String lessonCategory;
  String duration;
  List<Section> sections = [];

  Lesson({
    this.id,
    required this.title,
    required this.thumbnailUrl,
    required this.description,
    required this.createdDate,
    required this.rate,
    required this.lessonCategory,
    required this.duration,
    //required this.sections,
  });

  factory Lesson.fromJson(String str) => Lesson.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lesson.fromMap(Map<String, dynamic> json) => Lesson(
        title: json["title"],
        thumbnailUrl: json["thumbnailUrl"],
        description: json["description"],
        createdDate: json["createdDate"],
        rate: json["rate"].toDouble(),
        lessonCategory: json["lessonCategory"],
        duration: json["duration"],
        //sections: json[],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "thumbnailUrl": thumbnailUrl,
        "description": description,
        "createdDate": createdDate,
        "rate": rate,
        "lessonCategory": lessonCategory,
        "duration": duration,
        //"sections": sections,
      };

  Lesson copy() => Lesson(
        title: this.title,
        thumbnailUrl: this.thumbnailUrl,
        description: this.description,
        id: this.id,
        createdDate: this.createdDate,
        rate: this.rate,
        lessonCategory: this.lessonCategory,
        duration: this.duration,
        //sections: this.sections,
      );
}
