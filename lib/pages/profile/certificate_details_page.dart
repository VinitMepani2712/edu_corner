import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CertificateDetailsPage extends StatefulWidget {
  const CertificateDetailsPage({super.key});

  @override
  State<CertificateDetailsPage> createState() => _CertificateDetailsPageState();
}

class _CertificateDetailsPageState extends State<CertificateDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Advanced SEO  ",
                style: AppWidget.textStyle(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Certificate",
                style: AppWidget.normalTextStyle(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              thickness: 5,
              color: Color(0xff0E74BC),
              indent: 80,
              endIndent: 80,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              textAlign: TextAlign.start,
              "Sara Rehman",
              style: AppWidget.courseHeaderTextStyle(),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              textAlign: TextAlign.start,
              "Lorem ipsum dolor sit amet consectetur. Tincidunt tincidunt et dignissim nullam sit elit urna. Neque id lacinia eu imperdiet turpis neque. Magna et enim aenean nisl dignissim enim malesuada justo. At pharetra elit lectus vitae sapien enim magna enim leo.",
              style: AppWidget.courseLightTextStyle(),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.signature,
                      size: 75,
                    ),
                    Text(
                      "Umair Taseer",
                      style: AppWidget.normalTextStyle(),
                    ),
                    Text("Instructor", style: AppWidget.courseLightTextStyle()),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/certificate2.svg",
                          height: 75,
                          width: 75,
                        ),
                        Positioned(
                            top: 20,
                            child: Text(
                              "Edu Corner",
                              style: TextStyle(
                                  color: Color(0xff0E74BC),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ))
                      ],
                    ),
                    Text(
                      "Edu Corner",
                      style: AppWidget.normalTextStyle(),
                    ),
                    Text("Course App", style: AppWidget.courseLightTextStyle()),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Download Now  ",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFF0E74BC),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Plus Jakarta Sans",
                    color: Color(0xFF0E74BC)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
