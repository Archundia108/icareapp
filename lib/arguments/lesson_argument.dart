import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/section.dart';

class LessonArgument {
  final Lesson _lesson;
  //final Section _section;
  //final Lecture _lecture;

  LessonArgument(
    this._lesson,
    //this._section,
    //this._lecture,
  );

  Lesson get lesson => _lesson;
  //Section get section => _section;
  //Lecture get lecture => _lecture;
}
