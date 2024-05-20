import 'package:edu_corner/pages/payment/first_checkout_screen.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

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
            buildNewCard(context),
            buildAddCardButton(),
            SizedBox(height: 20.h),
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

  Widget buildNewCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150.h,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/screen/card.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(height: 20.h),
          Text("Card Holder"),
          SizedBox(height: 10.h),
          TextFormField(
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter Card holder name";
              }

              return null;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              fillColor: Color.fromRGBO(64, 123, 255, 0.03),
              filled: true,
              hintText: "Add Card Holder Name",
              hintStyle: TextStyle(color: Color(0xff858383)),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10.h),
          Text("Card Holder"),
          SizedBox(height: 10.h),
          TextFormField(
            controller: nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter card number";
              }
              final numericRegex = RegExp(r'^[0-9]{13,19}$');
              if (!numericRegex.hasMatch(value)) {
                return "Please enter a valid card number";
              }

              return null;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Color((0xffDEDEDE))),
              ),
              fillColor: Color.fromRGBO(64, 123, 255, 0.03),
              filled: true,
              hintText: "Please enter card number",
              hintStyle: TextStyle(color: Color(0xff858383)),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expiry Date"),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5.w,
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter expiry Date";
                        }
                        final expiryDateRegex =
                            RegExp(r'^(0[1-9]|1[0-2])\/(\d{2}|\d{4})$');
                        if (!expiryDateRegex.hasMatch(value)) {
                          return "Please enter a valid expiration date in MM/YY or MM/YYYY format";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                        filled: true,
                        hintText: "Expiry Date",
                        hintStyle: TextStyle(color: Color(0xff858383)),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.1.w,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CVV"),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.5.w,
                    child: TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter expiry Date";
                        }
                        final cvvRegex = RegExp(r'^\d{3,4}$');
                        if (!cvvRegex.hasMatch(value)) {
                          return "Please enter a valid CVV";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE))),
                        ),
                        fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                        filled: true,
                        hintText: "CVV",
                        hintStyle: TextStyle(color: Color(0xff858383)),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Save Card Information'),
            value: isChecked,
            onChanged: (newValue) {
              setState(() {
                isChecked = newValue ?? false;
              });
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }

  Widget buildAddCardButton() {
    return Form(
      key: _formKey,
      child: GestureDetector(
        onTap: () {
          if (_formKey.currentState!.validate())
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstCheckoutScreen(),
              ),
            );
        },
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10),
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
              "ADD NEW",
              textAlign: TextAlign.center,
              style: AppWidget.signUpAndLoginButtonTextStyle(),
            ),
          ),
        ),
      ),
    );
  }
}
