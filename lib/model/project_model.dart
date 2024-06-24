class Project {
  final int projectId;
  final String projectImage;
  final String projectName;
  final String description;
  final String fullDescription;

  Project({
    required this.projectId,
    required this.projectImage,
    required this.projectName,
    required this.description,
    required this.fullDescription,
  });
}

List<Project> projects = [
  Project(
    projectId: 1,
    projectImage: "assets/screen/python.png",
    projectName: "Project 1",
    description: " ",
    fullDescription:
        "Lorem ipsum dolor sit amet consectetur. Lectus viverra sed aliquam quis enim leo. Turpis nec facilisis placerat dolor ac donec. Odio semper quis rutrum quis lacus odio vivamus ultricies. Ultrices ultricies platea feugiat ac velit nulla. Proin lectus commodo id nullam.",
  ),
  Project(
    projectId: 2,
    projectImage: "assets/screen/flutter.png",
    projectName: "Project 2",
    description: " ",
    fullDescription:
        "Lorem ipsum dolor sit amet consectetur. Lectus viverra sed aliquam quis enim leo. Turpis nec facilisis placerat dolor ac donec. Odio semper quis rutrum quis lacus odio vivamus ultricies. Ultrices ultricies platea feugiat ac velit nulla. Proin lectus commodo id nullam.",
  ),
];
