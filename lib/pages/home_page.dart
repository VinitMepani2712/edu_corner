import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double progressPercentage = 75;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 35.0,
                left: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    foregroundImage: AssetImage("assets/screen/profile.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Hello Sara !"),
                  SizedBox(width: 10),
                  Image.asset(
                    "assets/screen/hand_wave.png",
                    height: 25,
                    width: 25,
                  ),

                  SizedBox(
                    width: 120,
                  ),
                  Image.asset(
                    "assets/screen/settings.png",
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(width: 10),
                  // SvgPicture.asset(
                  //   "assets/svg/doorbell.svg",
                  //   height: 25,
                  //   width: 25,
                  //   // ignore: deprecated_member_use
                  //   color: Colors.black,
                  // ),
                  Image.asset(
                    "assets/screen/Doorbell.png",
                    height: 25,
                    width: 25,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 270,
                    child: TextField(
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0E74BC),
                    ),
                    child: Image.asset(
                      "assets/screen/Tune.png",
                      height: 30,
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Top Categories"),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.computer),
                      label: Text(
                        "UI/UX Desgin",
                        style: AppWidget.lightTextStyle(),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xffD1CDCB)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 10)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.laptopCode),
                      label: Text(
                        "Web Development",
                        style: AppWidget.lightTextStyle(),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xffD1CDCB)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 10)),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(FontAwesomeIcons.figma),
                      label: Text(
                        "Figma",
                        style: AppWidget.lightTextStyle(),
                      ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(color: Color(0xffD1CDCB)),
                          ),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 10)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Continue Learning",
                      style: AppWidget.courseHeaderTextStyle()),
                  Text(
                    "View All",
                    style: TextStyle(color: Color(0xff0E74BC)),
                  ),
                ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Python",
                            style: AppWidget.courseHeaderTextStyle(),
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
                                "angela White",
                                style: AppWidget.courseLightTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1 Hour remaining ",
                            style: AppWidget.courseLightTextStyle(),
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
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          Text(
                            '${progressPercentage.toInt()}%',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Flutter",
                            style: AppWidget.courseHeaderTextStyle(),
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
                                "angela White",
                                style: AppWidget.courseLightTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "1 Hour remaining",
                            style: AppWidget.courseLightTextStyle(),
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
                                  AlwaysStoppedAnimation<Color>(Colors.blue),
                              backgroundColor: Colors.grey[300],
                            ),
                          ),
                          Text(
                            '${progressPercentage.toInt()}%',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("New & Trending Courses",
                      style: AppWidget.courseHeaderTextStyle()),
                  Text(
                    "View All",
                    style: TextStyle(color: Color(0xff0E74BC)),
                  ),
                ],
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  Card(
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
                      height: 218,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/screen/ui_ux_desgin.png",
                            width: 150,
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text("UI UX Designing",
                                    style: AppWidget.courseHeaderTextStyle()),
                                // SizedBox(width: ),
                                Icon(Icons.bookmark_border_sharp),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Beginners Level",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Text(
                                  "25  Videos",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      "4",
                                      style: AppWidget.courseLightTextStyle(),
                                    ),
                                    SizedBox(width: 70),
                                    Text(
                                      "\$200",
                                      style: AppWidget.priceTextStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
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
                      height: 218,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/screen/digital_marketing.png",
                            width: 158,
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Digital Marketing",
                                  style: AppWidget.courseHeaderTextStyle(),
                                ),
                                Icon(Icons.bookmark_border_sharp),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Advanced Level",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Text(
                                  "30 Videos",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text("5",
                                        style:
                                            AppWidget.courseLightTextStyle()),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Text(
                                      "Free",
                                      style: AppWidget.priceTextStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recommended Courses",
                    style: AppWidget.courseHeaderTextStyle(),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(color: Color(0xff0E74BC)),
                  ),
                ],
              ),
            ),
            FittedBox(
              child: Row(
                children: [
                  Card(
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
                      height: 218,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/screen/dev_ops.png",
                            width: 150,
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  "DevOps",
                                  style: AppWidget.courseHeaderTextStyle(),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Icon(
                                  Icons.bookmark_border_sharp,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Intermediate  Level",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Text(
                                  "20 Videos",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      "4.8",
                                      style: AppWidget.courseLightTextStyle(),
                                    ),
                                    SizedBox(width: 60),
                                    Text(
                                      "Free",
                                      style: AppWidget.priceTextStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
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
                      height: 218,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/screen/seo.png",
                            width: 150,
                            height: 125,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Row(
                              children: [
                                Text(
                                  "Advanced SEO",
                                  style: AppWidget.courseHeaderTextStyle(),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Icon(
                                  Icons.bookmark_border_sharp,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Advanced Level",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Text(
                                  "20 Videos",
                                  style: AppWidget.courseLightTextStyle(),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    Text(
                                      "4.8",
                                      style: AppWidget.courseLightTextStyle(),
                                    ),
                                    SizedBox(width: 60),
                                    Text(
                                      "\$350",
                                      style: AppWidget.priceTextStyle(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
