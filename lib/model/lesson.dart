import 'package:icareapp/model/lesson_category.dart';
import 'package:icareapp/model/section.dart';

class Lesson {
  final String _id;

  final String _title;

  final String _thumbnailUrl;

  final String _description;

  final String _createdDate;

  final double _rate;

  final LessonCategory _lessonCategory;

  final String _duration;

  final int _sectionNo;

  final List<Section> _sections;

  Lesson(
      this._id,
      this._title,
      this._thumbnailUrl,
      this._description,
      this._createdDate,
      this._rate,
      this._lessonCategory,
      this._duration,
      this._sectionNo,
      this._sections);

  double get rate => _rate;

  String get createdDate => _createdDate;

  String get description => _description;

  String get thumbnailUrl => _thumbnailUrl;

  String get title => _title;

  String get id => _id;

  LessonCategory get lessonCategory => _lessonCategory;

  String get duration => _duration;

  int get lessonNo => _sectionNo;

  List<Section> get sections => _sections;
}
