enum LessonCategory { all, basics, srstatus, severity, platforms }

extension LesssonCategoryExtension on LessonCategory {
  String get title {
    switch (this) {
      case LessonCategory.all:
        return "All";
      case LessonCategory.basics:
        return "Basics";
      case LessonCategory.srstatus:
        return "SR status";
      case LessonCategory.severity:
        return "Severity";
      case LessonCategory.platforms:
        return "Platforms";
    }
  }
}
