import 'dart:convert';

class Lecture {
  String? lectureId;
  String nameL;
  String durationL;

  Lecture({
    this.lectureId,
    required this.nameL,
    required this.durationL,
  });

  factory Lecture.fromJson(String str) => Lecture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lecture.fromMap(Map<String, dynamic> json) => Lecture(
        nameL: json["name"],
        durationL: json["durationL"],
      );

  Map<String, dynamic> toMap() => {
        "name": nameL,
        "duration": durationL,
      };

  Lecture copy() => Lecture(
        nameL: this.nameL,
        durationL: this.durationL,
      );
}
