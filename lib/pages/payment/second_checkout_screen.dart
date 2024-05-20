import 'package:edu_corner/pages/payment/add_new_card_screen.dart';
import 'package:edu_corner/pages/payment/payment_method_screen.dart';
import 'package:edu_corner/pages/payment/third_checkout_screen.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SecondCheckoutScreen extends StatefulWidget {
  const SecondCheckoutScreen({super.key});

  @override
  State<SecondCheckoutScreen> createState() => _SecondCheckoutScreenState();
}

class _SecondCheckoutScreenState extends State<SecondCheckoutScreen> {
  late PageController _pageController = PageController();
  int _currentIndex = 0;
  int selectedOption = 0;

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
            SizedBox(height: 20.h),
            buildCard(context),
            SizedBox(height: 20.h),
            buildOtherMethodPayment(),
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
              color: circleShape == 2 ? Color(0xff7EAEEF) : Color(0xff626D75),
              width: 5.0,
            ),
          ),
          child: CircleAvatar(
            backgroundColor:
                circleShape == 2 ? Color(0xff0E74BC) : Color(0xff414C54),
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

  Widget buildCard(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.center,
                height: 25,
                width: 120,
                decoration: BoxDecoration(
                  color: Color(0xffF1F1F1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Saved Card"),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewCardScreen(),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "Add New",
                      style: TextStyle(
                        color: Color(0xff0E74BC),
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      minRadius: 10,
                      maxRadius: 10,
                      backgroundColor: Color(0xff0E74BC),
                      child: Icon(
                        Icons.add,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 200,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            "assets/screen/card.png",
                            fit: BoxFit.fitHeight,
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
                  3,
                  (index) => buildDot(index),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildOtherMethodPayment() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Other ways to Pay",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE4EFF7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.creditCard,
                    color: Color(0xff199BE2),
                  ),
                  SizedBox(width: 10.w),
                  Text('Credit/Debit Card'),
                  SizedBox(width: 10.w),
                ],
              ),
              value: 1,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
          SizedBox(height: 20.w),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE4EFF7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.paypal,
                    color: Color(0xff199BE2),
                  ),
                  SizedBox(width: 10.w),
                  Text('PayPal'),
                  SizedBox(width: 10.w),
                ],
              ),
              value: 2,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
          SizedBox(height: 20.w),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE4EFF7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.apple,
                  ),
                  SizedBox(width: 10.w),
                  Text('Apple Pay'),
                  SizedBox(width: 10.w),
                ],
              ),
              value: 3,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(
                  () {
                    selectedOption = value!;
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20.w),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffE4EFF7),
              borderRadius: BorderRadius.circular(10),
            ),
            child: RadioListTile(
              controlAffinity: ListTileControlAffinity.trailing,
              title: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    color: Color(0xff199BE2),
                  ),
                  SizedBox(width: 10.w),
                  Text('Google Pay'),
                  SizedBox(width: 10.w),
                ],
              ),
              value: 4,
              groupValue: selectedOption,
              onChanged: (value) {
                setState(() {
                  selectedOption = value!;
                });
              },
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Amount to Pay",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(width: 10.w),
              Text(
                "\$240",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget buildPaymentButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ThirdCheckOutScreen(),
        ),
      ),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
              "PROCEED TO PAY",
              textAlign: TextAlign.center,
              style: AppWidget.signUpAndLoginButtonTextStyle(),
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      height: 2,
      width: 20,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _currentIndex == index ? Color(0xFF0E74BC) : Colors.grey,
      ),
    );
  }
}
