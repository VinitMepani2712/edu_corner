import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
            SizedBox(width: 20.w),
            Text(
              "My Cart",
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
                  margin: EdgeInsets.all(15.w),
                  clipBehavior: Clip.hardEdge,
                  semanticContainer: false,
                  borderOnForeground: true,
                  child: Container(
                    height: 100.h,
                    padding: EdgeInsets.all(8.0),
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
                            Row(
                              children: [
                                Text(
                                  "DevOps",
                                  style: AppWidget.courseHeaderTextStyle(),
                                ),
                                SizedBox(width: 70.w),
                                Icon(FontAwesomeIcons.trash),
                              ],
                            ),
                            Text(
                              "John Dena",
                              style: AppWidget.courseLightTextStyle(),
                            ),
                            Text(
                              "\$200",
                              style: AppWidget.courseHeaderTextStyle(),
                            ),
                            Text(
                              "Save For Later",
                              style: AppWidget.priceTextStyle(),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.6),
          Padding(
            padding: EdgeInsets.only(bottom: 20.h),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: 320.w,
              height: 54.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xff407BFF),
                border: Border.all(color: const Color(0xffDEDEDE)),
              ),
              child: Center(
                child: Text(
                  "CHECKOUT",
                  textAlign: TextAlign.center,
                  style: AppWidget.signUpAndLoginButtonTextStyle(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
