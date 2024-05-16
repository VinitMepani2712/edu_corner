import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the TabController when the widget is disposed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.arrow_back),
            SizedBox(
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Course Details",
                  style: AppWidget.appbarTextStyle(),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            Icon(
              Icons.shopping_cart,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.share,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset("assets/screen/course1.png"),
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
                  child: Icon(
                    FontAwesomeIcons.bookmark,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Positioned(
                  bottom: 190,
                  top: 0,
                  left: 320,
                  child: Icon(
                    FontAwesomeIcons.ellipsis,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                Positioned(
                  bottom: -10,
                  left: 60,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 240,
                        height: 25,
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Color(0xffc3c3c3),
                                blurRadius: 2.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 1.0),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(40),
                            color: Color.fromARGB(255, 255, 255, 255)),
                        child: Center(
                            child: Text(
                          "25 Videos  |   25 Hrs 25 Mins",
                          style: TextStyle(color: Color(0xff0E74BC)),
                        )),
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
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Digital Marketing"),
                      Text("\$299"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        "4",
                        style: AppWidget.courseLightTextStyle(),
                      ),
                      SizedBox(width: 05),
                      Text(
                        "(1.8k Learners)",
                        style: AppWidget.courseLightTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        foregroundImage:
                            AssetImage("assets/screen/profile.png"),
                      ),
                      SizedBox(
                        width: 05,
                      ),
                      Text(
                        "Angela White",
                        style: AppWidget.courseLightTextStyle(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 05,
                  ),
                  TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelColor: Colors.white,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(color: Colors.transparent),
                      color: Color(0xff0E74BC),
                    ),
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Color.fromARGB(0, 0, 0, 0);
                        }
                        return Color.fromARGB(0, 0, 0, 0);
                      },
                    ),
                    tabs: [
                      Tab(
                        text: "Curriculum",
                      ),
                      Tab(
                        text: "Projects",
                      ),
                      Tab(
                        text: "Comments",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ExpansionTile(
                          title: Row(children: [
                            Image.asset("assets/screen/curriculum.png"),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Lesson 1 :",
                                    style: AppWidget.courseHeaderTextStyle(),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Intro to Blockchain",
                                    style: AppWidget.courseHeaderTextStyle(),
                                  ),
                                ],
                              ),
                            )
                          ]),
                          backgroundColor: Colors.grey[200],
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_fill_outlined),
                                  Expanded(
                                    child: Text(
                                      '2.1  Blockchain  & Its Importance',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Icon(Icons.check_box),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_fill_outlined),
                                  Text(
                                    '2.2  Blockchain in  Banking System',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(Icons.check_box),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_fill_outlined),
                                  Text(
                                    '2.3 Blockchain Transaction',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(Icons.check_box),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  Icon(Icons.play_circle_fill_outlined),
                                  Text(
                                    '2.4 Transaction Initiation',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Icon(Icons.check_box),
                                ],
                              ),
                            ),
                          ],
                          onExpansionChanged: (bool expanded) {
                            setState(() {
                              isExpanded = expanded;
                            });
                          },
                          initiallyExpanded: isExpanded,
                        ),

                        //Projects

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("16668 Projects"),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/screen/python.png",
                                  height: 125,
                                  width: 150,
                                ),
                                Image.asset(
                                  "assets/screen/flutter.png",
                                  height: 125,
                                  width: 150,
                                ),
                              ],
                            ),
                            Text("View All"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Project Description",
                                style: AppWidget.courseHeaderTextStyle()),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                                "Lorem ipsum dolor sit amet consectetur. Lectus viverra sed aliquam quis enim leo. Turpis nec facilisis placerat dolor ac donec. Odio semper quis rutrum quis lacus odio vivamus ultricies. Ultrices ultricies platea feugiat ac velit nulla. Proin lectus commodo id nullam ")
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1223 Comments"),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Color(0xff949292)),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    minRadius: 30,
                                    maxRadius: 30,
                                    foregroundImage:
                                        AssetImage("assets/screen/profile.png"),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Related Courses",
                style: AppWidget.normalTextStyle(),
              ),
            ),
            FittedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DevOps",
                            style: AppWidget.courseHeaderTextStyle(),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur.",
                            style: AppWidget.courseLightTextStyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            FittedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "DevOps",
                            style: AppWidget.courseHeaderTextStyle(),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet consectetur.",
                            style: AppWidget.courseLightTextStyle(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
                width: 320,
                height: 54,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff407BFF),
                  border: Border.all(color: const Color(0xffDEDEDE)),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "Start learning",
                    style: AppWidget.signUpAndLoginButtonTextStyle(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
