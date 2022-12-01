import 'dart:convert';

import 'package:icareapp/model/lecture.dart';

class Section {
  String? sectionId;
  String name;
  String lessonID;

  Section({
    this.sectionId,
    required this.name,
    required this.lessonID,
  });

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        name: json["name"],
        lessonID: json["lessonID"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lessonID": lessonID,
      };

  Section copy() => Section(
        name: this.name,
        lessonID: this.lessonID,
      );
}
