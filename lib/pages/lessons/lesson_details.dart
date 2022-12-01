import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/section.dart';
import 'package:readmore/readmore.dart';

import '../../model/lesson.dart';

class LessonDetails extends StatelessWidget {
  const LessonDetails({
    super.key,
    required this.lesson,
    //required this.section,
    //required this.lecture,
  });

  final Lesson lesson;
  //final Section section;
  //final Lecture lecture;

  @override
  Widget build(BuildContext context) {
    var greyTextStyle = TextStyle(fontSize: 15, color: Colors.grey.shade800);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.arrow_back,
                            color: Colors.grey.shade800,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(lesson.thumbnailUrl),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                              ),
                              child: Text(
                                lesson.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.play_circle_fill_outlined),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '2 lectures',
                                      style: greyTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.access_time),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      lesson.duration,
                                      style: greyTextStyle,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      '${lesson.rate}',
                                      style: greyTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              lesson.description,
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: "Show more",
                              trimExpandedText: "Show less",
                              moreStyle: const TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                              lessStyle: const TextStyle(
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold,
                              ),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       "Lesson content",
                            //       style: TextStyle(
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 20,
                            //       ),
                            //     ),
                            //     Text(
                            //       '(${lesson.sections.length} sections)',
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //         color: Colors.grey.shade700,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   itemCount: lesson.sections.length,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   itemBuilder: (context, index) {
                            //     return buildLessonContent(index);
                            //   },
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(
                left: 5,
                right: 5,
                bottom: 5,
              ),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add lesson",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildLessonContent(int index) {
  //   Section section = lesson.sections[index];
  //   return ExpansionTile(
  //     title: Text(
  //       "Section ${index + 1} - ${section.name}",
  //       style: const TextStyle(
  //         fontSize: 18,
  //         fontWeight: FontWeight.bold,
  //       ),
  //     ),
  //     children: section.lectures.map((lecture) {
  //       return ListTile(
  //         dense: true,
  //         onTap: () {},
  //         leading: const SizedBox(),
  //         title: Text(lecture.name),
  //         subtitle: Row(
  //           children: [
  //             const Icon(
  //               Icons.access_time,
  //               size: 15,
  //             ),
  //             const SizedBox(
  //               width: 10,
  //             ),
  //             Text(
  //               lecture.duration,
  //               style: TextStyle(
  //                 color: Colors.grey.shade500,
  //                 fontSize: 15,
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     }).toList(),
  //   );
  // }
}
