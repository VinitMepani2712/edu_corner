import 'package:edu_corner/pages/profile/certificate_details_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "My Certificate",
            style: AppWidget.appbarTextStyle(),
          ),
        ),
        body: Column(
          children: [
            FittedBox(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CertificateDetailsPage()));
                    },
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
                                Row(
                                  children: [
                                    Text(
                                      "DevOps",
                                      style: AppWidget.courseHeaderTextStyle(),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    SvgPicture.asset(
                                      "assets/svg/certificate2.svg",
                                      // ignore: deprecated_member_use
                                      color: Color.fromARGB(255, 59, 168, 247),
                                    )
                                  ],
                                ),
                                Text(
                                  "John Dena",
                                  style: AppWidget.courseLightTextStyle(),
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
                ],
              ),
            ),
            FittedBox(
              child: Stack(
                children: [
                  Card(
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
                              Row(
                                children: [
                                  Text(
                                    "DevOps",
                                    style: AppWidget.courseHeaderTextStyle(),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  SvgPicture.asset(
                                    "assets/svg/certificate2.svg",
                                    // ignore: deprecated_member_use
                                    color: Color.fromARGB(255, 59, 168, 247),
                                  )
                                ],
                              ),
                              Text(
                                "John Dena",
                                style: AppWidget.courseLightTextStyle(),
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
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FittedBox(
              child: Stack(
                children: [
                  Card(
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
                              Row(
                                children: [
                                  Text(
                                    "DevOps",
                                    style: AppWidget.courseHeaderTextStyle(),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  SvgPicture.asset(
                                    "assets/svg/certificate2.svg",
                                    // ignore: deprecated_member_use
                                    color: Color.fromARGB(255, 59, 168, 247),
                                  )
                                ],
                              ),
                              Text(
                                "John Dena",
                                style: AppWidget.courseLightTextStyle(),
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
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FittedBox(
              child: Stack(
                children: [
                  Card(
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
                              Row(
                                children: [
                                  Text(
                                    "DevOps",
                                    style: AppWidget.courseHeaderTextStyle(),
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  SvgPicture.asset(
                                    "assets/svg/certificate2.svg",
                                    // ignore: deprecated_member_use
                                    color: Color.fromARGB(255, 59, 168, 247),
                                  )
                                ],
                              ),
                              Text(
                                "John Dena",
                                style: AppWidget.courseLightTextStyle(),
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
                            ],
                          ),
                          SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
