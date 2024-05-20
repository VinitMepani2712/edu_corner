import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/content_modal.dart';
import '../../widget/widget_support.dart';
import '../home_page.dart';
import '../Auth/log_in_page.dart';
import '../Auth/sign_up_page.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentIndex = 0;
  late PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 40.h,
                          left: 20.w,
                          right: 20.w,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.w),
                              child: Image.asset(
                                contents[i].image,
                                height: 300.h,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: AppWidget.textStyle(),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              contents[i].description,
                              textAlign: TextAlign.center,
                              style: AppWidget.lightTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (i < contents.length - 1)
                      Positioned(
                        top: 45.h,
                        right: 10.w,
                        child: GestureDetector(
                          onTap: () {
                            _controller.jumpToPage(contents.length - 1);
                          },
                          child: Container(
                            width: 60.w,
                            padding: EdgeInsets.all(10.w),
                            decoration: BoxDecoration(
                              color: Color(0xFF0E74BC),
                              borderRadius: BorderRadius.circular(20.w),
                            ),
                            child: Center(
                              child: Text(
                                "SKIP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: buildDot(index),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              }
              _controller.nextPage(
                duration: Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (currentIndex > 0 && currentIndex < contents.length - 1)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = currentIndex - 1;
                        });
                        _controller.previousPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceOut,
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5.w,
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF0E74BC),
                            width: 2.w,
                          ),
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Text(
                          "BACK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  if (currentIndex == contents.length - 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Add Explore Course Page Route
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFF0E74BC),
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Text(
                              "EXPLORE COURSE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5.w,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 10.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFF0E74BC),
                                width: 2.w,
                              ),
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(8.w),
                            ),
                            child: Text(
                              "SIGN UP",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Color(0xFF6C6C6C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              ),
                              Text(
                                " Login Now",
                                style: TextStyle(
                                  color: Color(0xFF0E74BC),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (currentIndex <
                      contents.length -
                          1) // Show next button on pages 1 to (last - 1)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = currentIndex + 1;
                        });
                        _controller.nextPage(
                          duration: Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Center(
                        child: Container(
                          width: currentIndex == 0
                              ? MediaQuery.of(context).size.width / 1.5.w
                              : MediaQuery.of(context).size.width / 2.5.w,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? Color(0xFF0E74BC)
                                : Color(0xFF0E74BC),
                            borderRadius: BorderRadius.circular(8.w),
                          ),
                          child: Text(
                            "NEXT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.white
                                  : Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 75.h),
        ],
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 2.0.h,
      width: currentIndex == index ? 20.w : 10.w,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: currentIndex == index ? Color(0xFF0E74BC) : Colors.grey,
      ),
    );
  }
}

                          
