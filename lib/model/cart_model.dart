import 'package:edu_corner/model/course_model.dart';

class CartItem {
  final CourseModel course;
  int quantity;

  CartItem({required this.course, this.quantity = 1});
}

List<CartItem> cartItems = [];
