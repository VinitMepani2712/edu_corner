import 'package:edu_corner/screen/payment/add_new_card_screen.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dotted_border/dotted_border.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Payment Method"),
        ),
        body: Column(
          children: [
            buildNoCard(),
            SizedBox(height: MediaQuery.of(context).size.height / 4.4.h),
            buildAddCardButton(),
          ],
        ));
  }

  Widget buildNoCard() {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5.5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            minRadius: 100,
            maxRadius: 100,
            backgroundColor: Color(0xffE4EFF7),
            child: Icon(
              FontAwesomeIcons.creditCard,
              size: 75,
              color: Color(0xff0e74bc),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "No Card Added",
            style: AppWidget.courseHeaderTextStyle(),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Text(
              "You don\’t added any credit/debit card yet.Please add the card now.",
              style: AppWidget.courseLightTextStyle(),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAddCardButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewCardScreen(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: DottedBorder(
          strokeCap: StrokeCap.round,
          color: Color(0xff0E74BC),
          radius: Radius.circular(10),
          dashPattern: [5, 3],
          borderType: BorderType.RRect,
          child: Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width / 1,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ADD NEW",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff0E74BC),
                  ),
                ),
                SizedBox(width: 10.w),
                CircleAvatar(
                  backgroundColor: Color(0xff0E74BC),
                  minRadius: 10,
                  maxRadius: 10,
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Color(0xffFFFFFF),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
