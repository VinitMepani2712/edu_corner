import 'package:edu_corner/model/comment_model.dart';
import 'package:edu_corner/model/course_deatils_model.dart';
import 'package:edu_corner/model/curriculum_model.dart';
import 'package:edu_corner/model/project_model.dart';
import 'package:edu_corner/model/releted_course.dart';
import 'package:edu_corner/provider/homes_screen_provider.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CourseDetailsScreen extends StatefulWidget {
  final CourseDetailsModel courseDetailsModel;

  CourseDetailsScreen({
    required this.courseDetailsModel,
  });

  @override
  State<CourseDetailsScreen> createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen>
    with SingleTickerProviderStateMixin {
  late bool isSaved;

  late TabController _tabController;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    isSaved = widget.courseDetailsModel.isSaved;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeProviderScreen homeProviderScreen =
        Provider.of<HomeProviderScreen>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Course Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCourseImage(homeProviderScreen),
            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w),
              child: Column(
                children: [
                  _buildCourseTitleAndPrice(),
                  SizedBox(height: 8.0),
                  _buildCourseRatingAndLearner(),
                  SizedBox(height: 8.0),
                  _buildInstructorInfo(),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
            _buildTabbedContent(),
            SizedBox(height: 8.0),
            _buildRelatedCourses(),
            SizedBox(height: 8.0),
            _buildStartLearningButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseImage(HomeProviderScreen homeProviderScreen) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          widget.courseDetailsModel.course.image,
          width: double.infinity,
          height: 250.0,
          fit: BoxFit.fill,
        ),
        Positioned(
          bottom: 25,
          top: 25,
          left: 150,
          child: Icon(
            FontAwesomeIcons.circlePlay,
            color: Colors.white,
            size: 50,
          ),
        ),
        Positioned(
          bottom: 190,
          top: 0,
          left: 280,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isSaved = !isSaved;
              });
              homeProviderScreen.updateFavoriteData(
                  id: widget.courseDetailsModel.course.id);
            },
            child: Icon(
              isSaved
                  ? Icons.bookmark_added_rounded
                  : Icons.bookmark_add_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
        Positioned(
          bottom: 190,
          top: 0,
          left: 320,
          child: Icon(
            FontAwesomeIcons.ellipsis,
            color: Colors.white,
            size: 30,
          ),
        ),
        Positioned(
          bottom: -10,
          left: 60,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 250,
                height: 25,
                decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xffc3c3c3),
                        blurRadius: 2.0,
                        spreadRadius: 1.5,
                        offset: Offset(0.0, 1.0),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(40),
                    color: Color.fromARGB(255, 255, 255, 255)),
                child: Center(
                  child: Text(
                    "${widget.courseDetailsModel.course.videos} Videos  |  ${widget.courseDetailsModel.course.hoursLeft ?? 'Time not available'}",
                    style: TextStyle(color: Color(0xff0E74BC)),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: 0,
                left: -100,
                right: 130,
                child: CircleAvatar(
                  backgroundColor: Color(0xff0E74BC),
                  child: Icon(
                    FontAwesomeIcons.plus,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 20,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                top: -20,
                left: 130,
                right: -105,
                child: Icon(
                  Icons.circle,
                  color: Color(0xff0E74BC),
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCourseTitleAndPrice() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.courseDetailsModel.course.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          '\u{20B9} ${widget.courseDetailsModel.course.price}',
          style: TextStyle(fontSize: 18, color: Colors.blue),
        ),
      ],
    );
  }

  Widget _buildCourseRatingAndLearner() {
    return Row(
      children: [
        if (widget.courseDetailsModel.course.rating != null)
          Row(
            children: [
              Icon(Icons.star, color: Colors.yellow),
              SizedBox(width: 4.0),
              Text(
                widget.courseDetailsModel.course.rating!.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ],
          ),
        if (widget.courseDetailsModel.course.rating != null &&
            widget.courseDetailsModel.course.learner != null)
          SizedBox(width: 8.0),
        if (widget.courseDetailsModel.course.learner != null)
          Text(
            ' ${widget.courseDetailsModel.course.learner!}',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
      ],
    );
  }

  Widget _buildInstructorInfo() {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage:
              AssetImage(widget.courseDetailsModel.course.instructorImage),
          radius: 20.w,
        ),
        SizedBox(width: 10.w),
        if (widget.courseDetailsModel.course.instructor != null)
          Text(
            widget.courseDetailsModel.course.instructor!,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ),
      ],
    );
  }

  Widget _buildTabbedContent() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: Colors.white,
            indicator: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.transparent),
              color: Color(0xff0E74BC),
            ),
            tabs: [
              Tab(text: "Curriculum"),
              Tab(text: "Projects"),
              Tab(text: "Comments"),
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildCurriculumContent(),
                _buildProjectsContent(),
                _buildCommentsContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurriculumContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: courses.map((curriculum) {
            return Card(
              elevation: 5,
              child: ExpansionTile(
                collapsedBackgroundColor: Color(0xffE4EFF7),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                title: Row(
                  children: [
                    Image.asset("assets/screen/curriculum.png"),
                    SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${curriculum.lessonNumber} :",
                            style: AppWidget.courseHeaderTextStyle(),
                          ),
                          SizedBox(height: 15),
                          Text(
                            "${curriculum.lessonTitle}",
                            style: AppWidget.courseHeaderTextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                backgroundColor: Colors.grey[200],
                children: curriculum.topics.map((topic) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Icon(Icons.play_circle_fill_outlined),
                        Expanded(
                          child: Text(
                            topic,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(Icons.check_box),
                      ],
                    ),
                  );
                }).toList(),
                onExpansionChanged: (bool expanded) {
                  // Handle expansion state if needed
                },
                initiallyExpanded: false, // Adjust this as per your logic
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProjectsContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${projects.length} Projects"),
            Row(
              children: projects.map((project) {
                return Image.asset(
                  project.projectImage,
                  height: 125,
                  width: 150,
                );
              }).toList(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "View All",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            SizedBox(height: 10),
            Text("Project Description",
                style: AppWidget.courseHeaderTextStyle()),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: projects.map((project) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${project.projectName}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text("${project.description}"),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentsContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${comments.length} Comments"),
            SizedBox(height: 10),
            Column(
              children: comments.map((comment) {
                return Container(
                  margin: EdgeInsets.all(3),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Color(0xff949292)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              minRadius: 30,
                              maxRadius: 30,
                              foregroundImage:
                                  AssetImage("assets/screen/profile.png"),
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.commenterName,
                                  style: AppWidget.courseHeaderTextStyle(),
                                ),
                                Text(
                                  comment.commenterRole,
                                  style: AppWidget.courseHeaderTextStyle(),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Wrap(
                          children: [
                            Text(comment.commentText),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.favorite),
                            Text(comment.likes.toString()),
                            SizedBox(width: 10),
                            Icon(Icons.comment_sharp),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2.5,
                            ),
                            Text(comment.postedTime),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRelatedCourses() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          Text(
            "Related Courses",
            style: AppWidget.normalTextStyle(),
          ),
          Column(
            children: relatedCourses.map((course) {
              return FittedBox(
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.all(15.0),
                  clipBehavior: Clip.hardEdge,
                  semanticContainer: false,
                  borderOnForeground: true,
                  child: Container(
                    height: 100,
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/screen/python.png",
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course.courseName,
                              style: AppWidget.courseHeaderTextStyle(),
                            ),
                            Text(
                              course.courseDescription,
                              style: AppWidget.courseLightTextStyle(),
                            ),
                          ],
                        ),
                        SizedBox(width: 15),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStartLearningButton() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: 320,
        height: 54,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xff407BFF),
          border: Border.all(color: const Color(0xffDEDEDE)),
        ),
        child: TextButton(
          onPressed: () {
            // Handle button press
          },
          child: Text(
            "Start learning",
            textAlign: TextAlign.center,
            style: AppWidget
                .signUpAndLoginButtonTextStyle(), // Assuming this style is defined
          ),
        ),
      ),
    );
  }
}
