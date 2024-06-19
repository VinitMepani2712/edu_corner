class Course {
  final String image;
  final String title;
  final String? instructor;
  final String instructorImage;

  final String? hoursLeft;
  final double progressPercentage;
  final double? rating;
  final String level;
  final String price;
  final bool isBookmarked;

  Course({
    required this.image,
    required this.title,
    this.instructor,
    required this.instructorImage,
    this.hoursLeft,
    required this.progressPercentage,
    this.rating,
    required this.level,
    required this.price,
    this.isBookmarked = false,
  });
}
