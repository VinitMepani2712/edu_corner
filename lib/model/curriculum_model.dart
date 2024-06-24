class Curriculum {
  final String lessonNumber;
  final String lessonTitle;
  final List<String> topics;

  Curriculum({
    required this.lessonNumber,
    required this.lessonTitle,
    required this.topics,
  });
}

List<Curriculum> courses = [
  Curriculum(
    lessonNumber: "Lesson 1",
    lessonTitle: "Intro to Blockchain",
    topics: [
      "Blockchain & Its Importance",
      "Blockchain in Banking System",
      "Blockchain Transaction",
      "Transaction Initiation",
    ],
  ),
  Curriculum(
    lessonNumber: "Lesson 2",
    lessonTitle: "Bitcoin Blockchain",
    topics: [
      "Blockchain & Its Importance",
      "Blockchain in Banking System",
      "Blockchain Transaction",
      "Transaction Initiation",
    ],
  ),
];
