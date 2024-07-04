import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CertificateDetailsPage extends StatefulWidget {
  const CertificateDetailsPage({Key? key});

  @override
  State<CertificateDetailsPage> createState() => _CertificateDetailsPageState();
}

class _CertificateDetailsPageState extends State<CertificateDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Advanced SEO",
                style: AppWidget.textStyle(),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                "Certificate",
                style: AppWidget.normalTextStyle(),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Divider(
              thickness: 5.h,
              color: Color(0xff0E74BC),
              indent: 80.w,
              endIndent: 80.w,
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Sara Rehman",
              style: AppWidget.courseHeaderTextStyle(),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Tincidunt tincidunt et dignissim nullam sit elit urna. Neque id lacinia eu imperdiet turpis neque. Magna et enim aenean nisl dignissim enim malesuada justo. At pharetra elit lectus vitae sapien enim magna enim leo.",
              style: AppWidget.courseLightTextStyle(),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.signature,
                      size: 75.w,
                    ),
                    Text(
                      "Umair Taseer",
                      style: AppWidget.normalTextStyle(),
                    ),
                    Text(
                      "Instructor",
                      style: AppWidget.courseLightTextStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20.w,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        SvgPicture.asset(
                          "assets/svg/certificate2.svg",
                          height: 75.w,
                          width: 75.w,
                        ),
                        Positioned(
                          top: 20.w,
                          child: Text(
                            "Edu Corner",
                            style: TextStyle(
                              color: Color(0xff0E74BC),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Edu Corner",
                      style: AppWidget.normalTextStyle(),
                    ),
                    Text(
                      "Course App",
                      style: AppWidget.courseLightTextStyle(),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: Text(
                "Download Now",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xFF0E74BC),
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Plus Jakarta Sans",
                  color: Color(0xFF0E74BC),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
