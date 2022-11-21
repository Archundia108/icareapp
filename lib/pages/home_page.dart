import 'package:flutter/material.dart';
import 'package:icareapp/widgets/cards.dart';
import 'package:icareapp/widgets/category_list.dart';
import 'package:icareapp/widgets/header.dart';
import 'package:icareapp/widgets/lesson_list.dart';
import 'package:icareapp/widgets/lesson_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 170,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Header(),
                      SizedBox(
                        height: 20,
                      ),
                      LessonSearch(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Cards(),
                    SizedBox(
                      height: 10,
                    ),
                    CategoryList(),
                    LessonList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "mycourses");
        },
        child: Icon(Icons.home),
        backgroundColor: Colors.red[700],
      ),
    );
  }
}
