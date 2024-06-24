import 'package:flutter/material.dart';

import '../widget/widget_support.dart';

class MyCoursePage extends StatefulWidget {
  const MyCoursePage({super.key});

  @override
  State<MyCoursePage> createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePage> {
  final double progressPercentage = 75;
  final double progressPercentage2 = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Courses"),
        ),
        body: Column(children: [
          Expanded(
              child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  labelColor: Colors.white,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff0E74BC),
                  ),
                  overlayColor: WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                      if (states.contains(WidgetState.pressed)) {
                        return Color.fromARGB(0, 0, 0, 0);
                      }
                      return Color.fromARGB(0, 0, 0, 0);
                    },
                  ),

                  tabs: [
                    Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xff0E74BC), width: 2.0),
                        ),
                        child: Tab(text: 'Ongoing')),
                    Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Color(0xff0E74BC), width: 2.0),
                        ),
                        child: Tab(text: 'Complete')),
                  ],
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          FittedBox(
                            child: Card(
                              elevation: 5,
                              color: Color(0xffFFFDFD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: const EdgeInsets.all(15.0),
                              clipBehavior: Clip.hardEdge,
                              semanticContainer: false,
                              borderOnForeground: true,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "assets/screen/python.png",
                                        width: 150,
                                        height: 125,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Python",
                                          style:
                                              AppWidget.courseHeaderTextStyle(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(
                                              "angela White",
                                              style: AppWidget
                                                  .courseLightTextStyle(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "1 Hour remaining ",
                                          style:
                                              AppWidget.courseLightTextStyle(),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 5,
                                            value: progressPercentage / 100,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.blue),
                                            backgroundColor: Colors.grey[300],
                                          ),
                                        ),
                                        Text(
                                          '${progressPercentage.toInt()}%',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Card(
                              elevation: 5,
                              color: Color(0xffFFFDFD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: const EdgeInsets.all(15.0),
                              clipBehavior: Clip.hardEdge,
                              semanticContainer: false,
                              borderOnForeground: true,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/screen/flutter.png",
                                      width: 150,
                                      height: 125,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Flutter",
                                          style:
                                              AppWidget.courseHeaderTextStyle(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(
                                              "angela White",
                                              style: AppWidget
                                                  .courseLightTextStyle(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "1 Hour remaining",
                                          style:
                                              AppWidget.courseLightTextStyle(),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 5,
                                            value: progressPercentage / 100,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.blue),
                                            backgroundColor: Colors.grey[300],
                                          ),
                                        ),
                                        Text(
                                          '${progressPercentage.toInt()}%',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          FittedBox(
                            child: Card(
                              elevation: 5,
                              color: Color(0xffFFFDFD),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              margin: const EdgeInsets.all(15.0),
                              clipBehavior: Clip.hardEdge,
                              semanticContainer: false,
                              borderOnForeground: true,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/screen/flutter.png",
                                      width: 150,
                                      height: 125,
                                      fit: BoxFit.fill,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Flutter",
                                          style:
                                              AppWidget.courseHeaderTextStyle(),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            SizedBox(
                                              width: 05,
                                            ),
                                            Text(
                                              "angela White",
                                              style: AppWidget
                                                  .courseLightTextStyle(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "1 Hour remaining",
                                          style:
                                              AppWidget.courseLightTextStyle(),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        SizedBox(
                                          height: 45,
                                          width: 45,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 5,
                                            value: progressPercentage2 / 100,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.blue),
                                            backgroundColor: Colors.grey[300],
                                          ),
                                        ),
                                        Text(
                                          '${progressPercentage2.toInt()}%',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ))
        ]));
  }
}
