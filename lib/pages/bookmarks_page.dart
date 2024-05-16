import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  @override
  Widget build(BuildContext context) {
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
                              // width: 200,
                              // height: 100,
                              // fit: BoxFit.fitWidth,
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
                                  Icon(FontAwesomeIcons.trash)
                                ],
                              ),
                              Text(
                                "\$200",
                                style: AppWidget.priceTextStyle(),
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
                  Positioned(
                    bottom: 5,
                    left: 50,
                    //top: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xff0E74BC)),
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
                              // width: 200,
                              // height: 100,
                              // fit: BoxFit.fitWidth,
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
                                  Icon(FontAwesomeIcons.trash)
                                ],
                              ),
                              Text(
                                "\$200",
                                style: AppWidget.priceTextStyle(),
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
                  Positioned(
                    bottom: 5,
                    left: 50,
                    //top: 0,
                    child: Container(
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xff0E74BC)),
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
                              // width: 200,
                              // height: 100,
                              // fit: BoxFit.fitWidth,
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
                                  Icon(FontAwesomeIcons.trash)
                                ],
                              ),
                              Text(
                                "Free",
                                style: AppWidget.priceTextStyle(),
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
                  // Positioned(
                  //   bottom: 5,
                  //   left: 50,
                  //   //top: 0,
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //           border:
                  //               Border.all(width: 1, color: Color(0xff0E74BC)),
                  //           color: Colors.white),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             left: 5.0, right: 5.0, top: 2, bottom: 2),
                  //         child: Text("Buy Now",
                  //             style: AppWidget.searchTextStyle()),
                  //       )),
                  // )
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
                                  Icon(FontAwesomeIcons.trash)
                                ],
                              ),
                              Text(
                                "Free",
                                style: AppWidget.priceTextStyle(),
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
                  // Positioned(
                  //   bottom: 5,
                  //   left: 50,
                  //   //top: 0,
                  //   child: Container(
                  //       decoration: BoxDecoration(
                  //           border:
                  //               Border.all(width: 1, color: Color(0xff0E74BC)),
                  //           color: Colors.white),
                  //       child: Padding(
                  //         padding: const EdgeInsets.only(
                  //             left: 5.0, right: 5.0, top: 2, bottom: 2),
                  //         child: Text("Buy Now",
                  //             style: AppWidget.searchTextStyle()),
                  //       )),
                  // ),
                ],
              ),
            ),
          ],
        ));
  }
}
