import 'package:flutter/material.dart';
import 'package:icareapp/arguments/lesson_argument.dart';
import 'package:icareapp/model/lesson.dart';

class LessonItem extends StatelessWidget {
  const LessonItem({super.key, required this.lesson});

  final Lesson lesson;

  @override
  Widget build(BuildContext context) {
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
                arguments: LessonArgument(lesson),
              );
            },
            child: Column(
              children: [
                Image.asset(lesson.thumbnailUrl),
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
