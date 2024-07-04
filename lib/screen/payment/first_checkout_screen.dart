import 'package:edu_corner/screen/payment/second_checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edu_corner/widget/widget_support.dart';

class FirstCheckoutScreen extends StatefulWidget {
  const FirstCheckoutScreen({Key? key}) : super(key: key);

  @override
  State<FirstCheckoutScreen> createState() => _FirstCheckoutScreenState();
}

class _FirstCheckoutScreenState extends State<FirstCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: AppWidget.appbarTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCheckoutContainer(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                "Details",
                style: TextStyle(fontSize: 25.sp),
              ),
            ),
            buildCourseDetails(),
            SizedBox(height: 10.h),
            buildApplyDiscount(),
            SizedBox(height: 30.h),
            buildFinalPrice(),
            SizedBox(height: 50.h),
            buildPaymentButton(),
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
              color: circleShape == 1 ? Color(0xff7EAEEF) : Color(0xff626D75),
              width: 5.0,
            ),
          ),
          child: CircleAvatar(
            backgroundColor:
                circleShape == 1 ? Color(0xff0E74BC) : Color(0xff414C54),
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

  Widget buildCourseDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: FittedBox(
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
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
                  child: Image.asset("assets/screen/python.png"),
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DevOps", style: AppWidget.courseHeaderTextStyle()),
                    Row(
                      children: [
                        Text("By Alexa Cary ",
                            style: AppWidget.courseLightTextStyle()),
                        SizedBox(width: 20.w),
                        Text("\$299", style: TextStyle(fontSize: 22.sp)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Text("4", style: AppWidget.courseLightTextStyle()),
                        SizedBox(width: 05),
                        Text("(1.8k Learners)",
                            style: AppWidget.courseLightTextStyle()),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 15.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildApplyDiscount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Apply Discount ",
            style: TextStyle(fontSize: 25.sp),
          ),
          Container(
            alignment: Alignment.center,
            height: 35.h,
            width: 75.w,
            decoration: BoxDecoration(
                color: Color(0xff0E74BC),
                borderRadius: BorderRadius.circular(20)),
            child: Text(
              "Apply",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFinalPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price before discount ",
                style: AppWidget.courseLightTextStyle(),
              ),
              SizedBox(width: 20.w),
              Text(
                "\$299",
                style: AppWidget.courseLightTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price before discount ",
                style: AppWidget.courseLightTextStyle(),
              ),
              SizedBox(width: 20.w),
              Text(
                "\$59",
                style: AppWidget.courseLightTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price before discount ",
                style: AppWidget.courseLightTextStyle(),
              ),
              SizedBox(width: 20.w),
              Text(
                "\$240",
                style: AppWidget.courseLightTextStyle(),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Divider(
            thickness: 2,
            indent: 20,
            endIndent: 20,
            color: Color(0xff898A8C),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Final Pirce ",
                style: AppWidget.priceTextStyle(),
              ),
              SizedBox(width: 20.w),
              Text(
                "\$240",
                style: AppWidget.courseLightTextStyle(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondCheckoutScreen(),
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
              "PAY NOW \$240",
              textAlign: TextAlign.center,
              style: AppWidget.signUpAndLoginButtonTextStyle(),
            ),
          ),
        ),
      ),
    );
  }


}
