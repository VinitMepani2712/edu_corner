import 'package:edu_corner/model/course_model.dart';

final List<Course> continueLearningCourses = [
  Course(
    image: "assets/screen/python.png",
    title: "Python",
    instructor: "Angela White",
    instructorImage: 'assets/screen/profile.png',
    hoursLeft: "1 Hour remaining",
    progressPercentage: 75,
    rating: 4.5,
    level: "Intermediate Level",
    price: "Free",
  ),
  Course(
    image: "assets/screen/flutter.png",
    title: "Flutter",
    instructor: "Angela White",
    instructorImage: 'assets/screen/profile.png',
    hoursLeft: "1 Hour remaining",
    progressPercentage: 60,
    rating: null,
    level: "Beginner",
    price: "Free",
  ),
  // Add more continue learning courses as needed
];

final List<Course> newAndTrendingCourses = [
  Course(
    image: "assets/screen/ui_ux_design.png",
    title: "UI/UX Designing",
    hoursLeft: null,
    progressPercentage: 00,
    instructorImage: 'assets/screen/profile.png',
    rating: 4.0,
    level: "Beginner Level",
    price: "Free",
    isBookmarked: true,
  ),
  Course(
    image: "assets/screen/digital_marketing.png",
    title: "Digital Marketing",
    hoursLeft: null,
    progressPercentage: 00,
    instructorImage: 'assets/screen/profile.png',
    rating: 5.0,
    level: "Advanced Level",
    price: "79.99",
    isBookmarked: false,
  ),
];

final List<Course> recommendedCourses = [
  Course(
    image: "assets/screen/dev_ops.png",
    title: "DevOps",
    hoursLeft: null,
    progressPercentage: 00,
    instructorImage: 'assets/screen/profile.png',
    rating: 4.8,
    level: "Intermediate Level",
    price: '39.99',
    isBookmarked: false,
  ),
  Course(
    image: "assets/screen/seo.png",
    title: "Advanced SEO",
    instructor: "SEO Expert",
    hoursLeft: null,
    instructorImage: 'assets/screen/profile.png',
    progressPercentage: 00,
    rating: 4.8,
    level: "Advanced Level",
    price: "59.99",
    isBookmarked: true,
  ),
  // Add more recommended courses as needed
];
