class CourseModel {
  int id;
  final String image;
  final String title;
  final String? instructor;
  final String instructorImage;
  final String? hoursLeft;
  final double progressPercentage;
  final double? rating;
  final String? learner;
  final String level;
  final String videos;
  final double price;
  final bool isBookmarked;
  final String category;
  bool isSaved;

  CourseModel({
    required this.id,
    required this.image,
    required this.title,
    this.instructor,
    required this.instructorImage,
    this.hoursLeft,
    required this.progressPercentage,
    this.rating,
    this.learner,
    required this.level,
    required this.videos,
    required this.price,
    this.isBookmarked = false,
    required this.isSaved,
    required this.category
  });
}
