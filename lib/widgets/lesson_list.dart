import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icareapp/lesson_model/lesson_provider.dart';
import 'package:icareapp/widgets/lesson_item.dart';

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: LessonProvider.lessonList.map((lesson) {
        return LessonItem(lesson: lesson);
      }).toList(),
    );
  }
}
