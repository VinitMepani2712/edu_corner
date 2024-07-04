import 'package:edu_corner/screen/bottombar/bottom_nav_bar.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThirdCheckOutScreen extends StatefulWidget {
  const ThirdCheckOutScreen({super.key});

  @override
  State<ThirdCheckOutScreen> createState() => _ThirdCheckOutScreenState();
}

class _ThirdCheckOutScreenState extends State<ThirdCheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCheckoutContainer(),
            SizedBox(height: 05.h),
            buildPaymentSuccessful(),
            SizedBox(height: MediaQuery.of(context).size.height / 8.3.h),
            buildPaymentButton()
          ],
        ),
      ),
    );
  }

  Widget buildCheckoutContainer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      decoration: BoxDecoration(
        color: Color(0xffE4EFF7),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      height: MediaQuery.of(context).size.height / 5.h,
      child: Padding(
        padding: EdgeInsets.only(top: 22.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var circleShape = 1; circleShape <= 3; circleShape++)
              buildCircleAvatar(circleShape),
          ],
        ),
      ),
    );
  }

  Widget buildCircleAvatar(int circleShape) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: circleShape == 3 ? Color(0xff7EAEEF) : Color(0xff626D75),
              width: 5.0,
            ),
          ),
          child: CircleAvatar(
            backgroundColor:
                circleShape == 3 ? Color(0xff0E74BC) : Color(0xff414C54),
            foregroundColor: Color.fromARGB(255, 255, 255, 255),
            child: Text("$circleShape"),
            maxRadius: 30.w,
            minRadius: 30.w,
          ),
        ),
        SizedBox(height: 10.h),
        Text(circleShape == 1
            ? "Details"
            : circleShape == 2
                ? "Payment Method"
                : "Confirmation"),
      ],
    );
  }

  Widget buildPaymentSuccessful() {
    return Column(
      children: [
        Image.asset("assets/screen/payment_successful.png"),
        Text(
          "Congratulations",
          style: AppWidget.courseHeaderTextStyle(),
        ),
        SizedBox(height: 10.h),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(
            "You have purchased a new course. You can start learning now",
            style: AppWidget.courseLightTextStyle(),
          ),
        ),
      ],
    );
  }

  Widget buildPaymentButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNavBarScreen(),
        ),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          width: 320.w,
          height: 54.h,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color(0xff407BFF),
            border: Border.all(color: const Color(0xffDEDEDE)),
          ),
          child: Center(
            child: Text(
              "OPEN COURSE",
              textAlign: TextAlign.center,
              style: AppWidget.signUpAndLoginButtonTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
