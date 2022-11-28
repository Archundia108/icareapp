import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icareapp/lesson_model/lesson_provider.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/services/lesson_service.dart';
import 'package:icareapp/widgets/lesson_item.dart';
import 'package:provider/provider.dart';

class LessonList extends StatelessWidget {
  const LessonList({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonService = Provider.of<LessonService>(context);

    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      children: [
        ListView.builder(
            itemCount: lessonService.lessons.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
                  child: LessonItem(
                    lesson: lessonService.lessons[index],
                  ),
                )),
      ],
      // children: LessonProvider.lessonList.map((lesson) {
      //   return LessonItem(lesson: lesson);
      // }).toList(),
    );
  }
}
