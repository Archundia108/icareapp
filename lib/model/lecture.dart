import 'dart:convert';

class Lecture {
  String? lectureId;
  String nameL;
  String durationL;
  String sectionID;

  Lecture({
    this.lectureId,
    required this.nameL,
    required this.durationL,
    required this.sectionID,
  });

  factory Lecture.fromJson(String str) => Lecture.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Lecture.fromMap(Map<String, dynamic> json) => Lecture(
        nameL: json["nameL"],
        durationL: json["durationL"],
        sectionID: json["sectionID"],
      );

  Map<String, dynamic> toMap() => {
        "nameL": nameL,
        "duration": durationL,
        "sectionID": sectionID,
      };

  Lecture copy() => Lecture(
        nameL: this.nameL,
        durationL: this.durationL,
        sectionID: this.sectionID,
      );
}
