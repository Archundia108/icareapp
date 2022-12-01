import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icareapp/lesson_model/lesson_provider.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/services/lecture_service.dart';
import 'package:icareapp/services/lesson_service.dart';
import 'package:icareapp/services/section_service.dart';
import 'package:icareapp/widgets/lesson_item.dart';
import 'package:provider/provider.dart';

class LessonListUser extends StatelessWidget {
  const LessonListUser({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonService = Provider.of<LessonService>(context);
    final sectionsService = Provider.of<SectionService>(context);
    final lectureService = Provider.of<LectureService>(context);

    // print(lessonService.lessonsUser);
    // print(lessonService.lessonsFiltered);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
      ),
      itemCount: lessonService.lessonsFiltered.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        child: LessonItem(
          lesson: lessonService.lessonsFiltered[index],
          //section: sectionsService.sections[index],
          //lecture: lectureService.lectures[index],
        ),
      ),
    );
  }
}
