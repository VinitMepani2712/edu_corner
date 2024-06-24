class Comment {
  final String commenterName;
  final String commenterRole;
  final String commentText;
  final int likes;
  final String postedTime;

  Comment({
    required this.commenterName,
    required this.commenterRole,
    required this.commentText,
    required this.likes,
    required this.postedTime,
  });
}

List<Comment> comments = [
  Comment(
    commenterName: "Moeed Hussain",
    commenterRole: "Student",
    commentText:
        "Lorem ipsum dolor sit amet consectetur. Lectus viverra sed aliquam quis enim leo. Turpis nec facilisis placerat dolor ac donec. Odio semper quis rutrum quis.",
    likes: 1,
    postedTime: "1 week ago",
  ),
  Comment(
    commenterName: "Moeed Hussain",
    commenterRole: "Student",
    commentText:
        "Lorem ipsum dolor sit amet consectetur. Lectus viverra sed aliquam quis enim leo. Turpis nec facilisis placerat dolor ac donec. Odio semper quis rutrum quis.",
    likes: 1,
    postedTime: "1 week ago",
  ),
];
