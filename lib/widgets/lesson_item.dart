import 'package:flutter/material.dart';
import 'package:icareapp/arguments/lesson_argument.dart';
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/section.dart';
import 'package:icareapp/services/lecture_service.dart';
import 'package:icareapp/services/lesson_service.dart';
import 'package:icareapp/services/section_service.dart';
import 'package:provider/provider.dart';

class LessonItem extends StatelessWidget {
  final Lesson lesson;
  //final Section section;
  //final Lecture lecture;

  const LessonItem({
    Key? key,
    required this.lesson,
    //required this.section,
    //required this.lecture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sectionService = Provider.of<SectionService>(context);
    final lectureService = Provider.of<LectureService>(context);

    return SizedBox(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                "lessonDetails",
                arguments: LessonArgument(
                  lesson,
                  //section,
                  //lecture,
                ),
              );
            },
            child: Column(
              children: [
                Image.network(lesson.thumbnailUrl),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        lesson.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.indigo,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${lesson.rate}',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                          Text(
                            lesson.createdDate,
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
