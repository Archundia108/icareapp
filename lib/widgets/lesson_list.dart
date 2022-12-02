import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icareapp/lesson_model/lesson_provider.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/services/lecture_service.dart';
import 'package:icareapp/services/lesson_service.dart';
import 'package:icareapp/services/section_service.dart';
import 'package:icareapp/widgets/lesson_item.dart';
import 'package:provider/provider.dart';

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonService = Provider.of<LessonService>(context);
    final sectionsService = Provider.of<SectionService>(context);
    final lectureService = Provider.of<LectureService>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "All lessons",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade800),
        ),
        const SizedBox(
          height: 10,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
          ),
          itemCount: lessonService.lessons.length,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) => GestureDetector(
            child: LessonItem(
              lesson: lessonService.lessons[index],
              //section: sectionsService.sections[index],
              //lecture: lectureService.lectures[index],
            ),
          ),
        ),
      ],
    );
  }
}
