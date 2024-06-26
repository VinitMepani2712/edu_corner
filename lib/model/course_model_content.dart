import 'package:edu_corner/model/course_model.dart';

final List<CourseModel> allCourse = [
  CourseModel(
      image: "assets/screen/python.png",
      title: "Python",
      instructor: "Angela White",
      instructorImage: 'assets/screen/profile.png',
      hoursLeft: "1 Hour remaining",
      progressPercentage: 75,
      rating: 4.5,
      level: "Intermediate Level",
      price: 0,
      videos: "20",
      learner: "(1.8k Learners)",
      id: 1,
      isSaved: false,
      category: "continueLearningCourses"),
  CourseModel(
      image: "assets/screen/flutter.png",
      title: "Flutter",
      instructor: "Angela White",
      instructorImage: 'assets/screen/profile.png',
      hoursLeft: "1 Hour remaining",
      progressPercentage: 60,
      rating: null,
      level: "Beginner",
      price: 0,
      videos: "20",
      learner: "(1.8k Learners)",
      id: 2,
      isSaved: false,
      category: "continueLearningCourses"),

  CourseModel(
      image: "assets/screen/ui_ux_design.png",
      title: "UI/UX Designing",
      hoursLeft: null,
      progressPercentage: 00,
      instructorImage: 'assets/screen/profile.png',
      instructor: "Angela White",
      rating: 4.0,
      level: "Beginner Level",
      price: 0,
      isBookmarked: false,
      videos: "20",
      learner: "(1.8k Learners)",
      id: 3,
      isSaved: false,
      category: "newAndTrendingCourses"),
  CourseModel(
      image: "assets/screen/digital_marketing.png",
      title: "Digital Marketing",
      hoursLeft: null,
      progressPercentage: 00,
      instructorImage: 'assets/screen/profile.png',
      instructor: "Angela White",
      rating: 5.0,
      level: "Advanced Level",
      price: 799.99,
      isBookmarked: false,
      videos: "20",
      learner: "(1.8k Learners)",
      id: 4,
      isSaved: false,
      category: "newAndTrendingCourses"),


  CourseModel(
      image: "assets/screen/dev_ops.png",
      title: "DevOps",
      hoursLeft: null,
      progressPercentage: 00,
      instructorImage: 'assets/screen/profile.png',
      instructor: "Angela White",
      rating: 4.8,
      level: "Intermediate Level",
      price: 399.99,
      isBookmarked: false,
      videos: "20",
      learner: "(1.8k Learners)",
      id: 5,
      isSaved: false,
      category: "recommendedCourses"),
  CourseModel(
      image: "assets/screen/seo.png",
      title: "Advanced SEO",
      instructor: "Angela White",
      hoursLeft: null,
      instructorImage: 'assets/screen/profile.png',
      progressPercentage: 00,
      rating: 4.8,
      level: "Advanced Level",
      price: 599.99,
      isBookmarked: false,
      videos: "20",
      learner: "(1.8k Learners)",
      id: 6,
      isSaved: false,
      category: "recommendedCourses"),
      ];



Map<String, dynamic> categorizeAndFilterCourses(List<CourseModel> courses) {
  Map<String, List<CourseModel>> categorizedCourses = {};
  List<CourseModel> continueLearningCourses = [];

  for (var course in courses) {
    if (categorizedCourses[course.category] == null) {
      categorizedCourses[course.category] = [];
    }
    categorizedCourses[course.category]!.add(course);

    if (course.category == "continueLearningCourses") {
      continueLearningCourses.add(course);
    }
  }

  return {
    "categorizedCourses": categorizedCourses,
    "continueLearningCourses": continueLearningCourses
  };
}
