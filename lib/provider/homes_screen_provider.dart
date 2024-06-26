import 'package:flutter/material.dart';
import 'package:edu_corner/model/course_model.dart';
import 'package:edu_corner/model/course_model_content.dart';

class HomeProviderScreen with ChangeNotifier {
  int currentIndex = 0;
  List<CourseModel> allCourseData = [];
  List<CourseModel> filteredCourse = [];
  List<CourseModel> savedCourse = [];

  void installDataLoad() {
    allCourseData.clear();
    filteredCourse.clear();
    allCourseData.addAll(allCourse);
    savedCourse = allCourseData.where((item) => item.isSaved).toList();

    notifyListeners();
  }

  void setCurrentIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void updateFavoriteData({required int id}) {
    for (var data in allCourseData) {
      if (data.id == id) {
        data.isSaved = !data.isSaved;
        if (data.isSaved) {
          savedCourse.add(data);
        } else {
          savedCourse.removeWhere((item) => item.id == id);
        }
        notifyListeners();
      }
    }
  }
}
