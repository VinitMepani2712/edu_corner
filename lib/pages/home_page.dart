import 'package:edu_corner/model/course_model.dart';
import 'package:edu_corner/model/course_model_content.dart';
import 'package:edu_corner/pages/home/notifiction_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            _buildHeader(),
            _buildSearchBar(),
            SizedBox(height: 20.h),
            _buildSectionTitle("Top Categories"),
            SizedBox(height: 10.h),
            _buildCategoryButtons(),
            SizedBox(height: 10.h),
            _buildCourseSection("Continue Learning", continueLearningCourses),
            SizedBox(height: 10.h),
            _buildCourseSectionHorizontalScroll(
                "New & Trending Courses", newAndTrendingCourses),
            SizedBox(height: 20.h),
            _buildCourseSectionHorizontalScroll(
                "Recommended Courses", recommendedCourses),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding:
          EdgeInsets.only(left: 20.w, right: 20.w, top: 35.0.h, bottom: 20.0.h),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/screen/profile.png"),
          ),
          SizedBox(width: 10.w),
          Text("Hello Sara !"),
          SizedBox(width: 10.w),
          Image.asset(
            "assets/screen/hand_wave.png",
            height: 25.h,
            width: 25.h,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationPage(),
                ),
              );
            },
            child: Image.asset(
              "assets/screen/Doorbell.png",
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff0E74BC),
            ),
            child: Icon(
              Icons.tune,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Text(
        title,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildCategoryButtons() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Row(
          children: [
            _buildCategoryButton(FontAwesomeIcons.computer, "UI/UX Design"),
            SizedBox(width: 10.w),
            _buildCategoryButton(
                FontAwesomeIcons.laptopCode, "Web Development"),
            SizedBox(width: 10.w),
            _buildCategoryButton(FontAwesomeIcons.figma, "Figma"),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(IconData iconData, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(iconData),
      label: Text(
        label,
        style: TextStyle(fontSize: 16.sp, color: Colors.black),
      ),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xffD1CDCB)),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.transparent),
        padding:
            WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10.w)),
      ),
    );
  }

  Widget _buildCourseSection(String title, List<Course> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(color: Color(0xff0E74BC)),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return _buildCourseRow(
              courses[index],
            );
          },
        ),
      ],
    );
  }

  Widget _buildCourseRow(Course course) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                course.image,
                width: 150.w,
                height: 100.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(course.instructorImage),
                            radius: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          if (course.instructor != null) ...[
                            Text(
                              course.instructor!,
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ],
                      ),
                      SizedBox(height: 5.h),
                      if (course.hoursLeft != null) ...[
                        Text(
                          course.hoursLeft!,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ],
                  ),
                  Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: course.progressPercentage / 100,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        backgroundColor: Colors.grey[300],
                      ),
                      Text(
                        '${course.progressPercentage.toInt()}%',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseSectionHorizontalScroll(
      String title, List<Course> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "View All",
                style: TextStyle(color: Color(0xff0E74BC)),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              courses.length,
              (index) => _buildCourseCard(courses[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCourseCard(Course course) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        color: Color(0xffFFFDFD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10.w),
        child: Container(
          width: 165.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  course.image,
                  width: double.infinity,
                  height: 150.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding:
                    EdgeInsets.only(left: 8.0.w, right: 10.0.w, bottom: 10.0.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          course.title,
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        Icon(Icons.bookmark_border_sharp),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      course.level,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                    SizedBox(height: 10.h),
                    if (course.rating != null) ...[
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(
                            course.rating!.toString(),
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.grey),
                          ),
                          Spacer(),
                          Text(
                            '\u{20B9} ${course.price}',
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
