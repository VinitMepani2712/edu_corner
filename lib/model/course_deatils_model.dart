import 'package:edu_corner/model/cart_item_model.dart';
import 'package:edu_corner/model/course_model.dart';

class CourseDetailsModel {
  CourseModel course;
  bool isSaved;
  final List<String> imagePaths;
  Function(bool) onSavedToggle;
  int selectedImageIndex;
   List<CartItems> cartItems;

  CourseDetailsModel({
    required this.course,
    required this.isSaved,
    required this.onSavedToggle,
    required this.imagePaths,
    required this.selectedImageIndex,
     List<CartItems>? cartItems,
  }) : cartItems = cartItems ?? [];
}
