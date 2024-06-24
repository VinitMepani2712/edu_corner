import 'package:edu_corner/model/course_model.dart';

class CourseDetailsModel {
  CourseModel course;
  bool isSaved;
  Function(bool) onSavedToggle;

  CourseDetailsModel({
    required this.course,
    required this.isSaved,
    required this.onSavedToggle,
  });
}
