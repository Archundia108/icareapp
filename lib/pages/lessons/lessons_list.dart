import 'package:flutter/material.dart';
import 'package:icareapp/lesson_model/lesson_provider.dart';
import 'package:icareapp/services/lesson_service.dart';
import 'package:icareapp/widgets/lesson_item.dart';
import 'package:icareapp/widgets/lesson_list.dart';
import 'package:icareapp/widgets/lesson_list_user.dart';
import 'package:provider/provider.dart';

class MyLessons extends StatelessWidget {
  const MyLessons({super.key});
  @override
  Widget build(BuildContext context) {
    final lessonService = Provider.of<LessonService>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'My lessons',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900),
                  ),
                ),
                // SizedBox(
                //   height: 30,
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 5),
                //         child: Container(
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //               color: Colors.blue,
                //               borderRadius: BorderRadius.all(Radius.circular(10)),
                //               border: Border.all(color: Colors.grey.shade900)),
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(horizontal: 10),
                //             child: Text(
                //               "All lessons",
                //               style: TextStyle(color: Colors.white),
                //             ),
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 5),
                //         child: Container(
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //               color: Colors.grey.shade200,
                //               borderRadius: BorderRadius.all(Radius.circular(10)),
                //               border: Border.all(color: Colors.grey.shade900)),
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(horizontal: 10),
                //             child: Text(
                //               "Downloaded lessons",
                //             ),
                //           ),
                //         ),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 5),
                //         child: Container(
                //           alignment: Alignment.center,
                //           decoration: BoxDecoration(
                //               color: Colors.grey.shade200,
                //               borderRadius: BorderRadius.all(Radius.circular(10)),
                //               border: Border.all(color: Colors.grey.shade900)),
                //           child: Padding(
                //             padding: const EdgeInsets.symmetric(horizontal: 10),
                //             child: Text(
                //               "Archived lessons",
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                LessonListUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
