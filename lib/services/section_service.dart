import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:http/http.dart' as http;
import 'package:icareapp/model/lecture.dart';
import 'package:icareapp/model/lesson.dart';
import 'package:icareapp/model/section.dart';

class SectionService extends ChangeNotifier {
  final String _baseUrl = 'icareapp-12-default-rtdb.firebaseio.com';

  final List<Section> sections = [];

  SectionService() {
    this.obtainSections();
  }

  Future obtainSections() async {
    notifyListeners();

    final urlSections = Uri.https(_baseUrl, 'sections.json');
    final respSections = await http.get(urlSections);

    final Map<String, dynamic> sectionsMap = json.decode(respSections.body);

    sectionsMap.forEach((key, value) {
      final sectionTemp = Section.fromMap(value);
      sectionTemp.sectionId = key;

      this.sections.add(sectionTemp);
    });

    notifyListeners();
    return this.sections;
  }
}
