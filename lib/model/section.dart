import 'dart:convert';

import 'package:icareapp/model/lecture.dart';

class Section {
  String? sectionId;
  String name;
  List<Lecture> lectures;

  Section({
    this.sectionId,
    required this.name,
    required this.lectures,
  });

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
        name: json["name"],
        lectures: json["lectures"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "lectures": lectures,
      };

  Section copy() => Section(
        name: this.name,
        lectures: this.lectures,
      );
}
