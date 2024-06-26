import 'package:edu_corner/model/course_deatils_model.dart';
import 'package:edu_corner/model/course_model.dart';
import 'package:edu_corner/pages/course_details/course_details_screen.dart';
import 'package:edu_corner/provider/homes_screen_provider.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
    HomeProviderScreen homeProviderScreen =
        Provider.of<HomeProviderScreen>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            SizedBox(
              width: 10,
            ),
            Text(
              "Bookmarks",
              style: AppWidget.appbarTextStyle(),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: buildCard(homeProviderScreen)),
        ],
      ),
    );
  }

  Widget buildCard(HomeProviderScreen homeProviderScreen) {
    if (homeProviderScreen.savedCourse.isEmpty) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            "In this, you haven't added any courses to your learning list yet. \n\n Browse through and pick your course to start learning!",
            style: TextStyle(fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: homeProviderScreen.savedCourse.length,
          itemBuilder: (context, index) {
            final course = homeProviderScreen.savedCourse[index];
            return buildCourseCard(course, index, homeProviderScreen);
          },
        ),
      );
    }
  }

  Widget buildCourseCard(
    CourseModel course,
    int index,
    HomeProviderScreen homeProviderScreen,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CourseDetailsScreen(
            courseDetailsModel: CourseDetailsModel(
              course: course,
              onSavedToggle: (isSaved) {},
              isSaved: true,
              imagePaths: [],
              selectedImageIndex: 0,
            ),
          ),
        ),
      ),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
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
                  if (course.price > 0)
                    Positioned(
                      bottom: -18,
                      left: 30,
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Color(0xff0E74BC)),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 5.0, right: 5.0, top: 2, bottom: 2),
                            child: Text("Buy Now",
                                style: AppWidget.searchTextStyle()),
                          )),
                    )
                ],
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
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
                    if (course.price == 0)
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      )
                    else
                      Text(
                        '\u{20B9} ${course.price}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    if (course.rating != null)
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          SizedBox(width: 4.0),
                          Text(
                            course.rating!.toString(),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    if (course.rating != null && course.learner != null)
                      SizedBox(width: 8.0),
                    if (course.learner != null)
                      Text(
                        ' ${course.learner!}',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
