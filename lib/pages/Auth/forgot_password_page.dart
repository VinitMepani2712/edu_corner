import 'package:edu_corner/pages/bottombar/bottom_nav_bar.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isIconPressed = true;
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;
  String password = "";
  String confirmPassword = "";

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 15.w),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Reset Password ",
                  textAlign: TextAlign.center,
                  style: AppWidget.headerTextStyle(),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Reset Password for Edu Corner",
                  textAlign: TextAlign.center,
                  style: AppWidget.normalTextStyle(),
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  validator: (value) => value == null || value.isEmpty
                      ? "Enter your password"
                      : value.length < 8
                          ? "Password must be at least 8 characters long, \n1 Uppercase letter, \n1 Lowercase letter, \n1 Special Character"
                          : null,
                  controller: passwordController,
                  obscureText: !isPasswordVisible1,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xff858383)),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                        isPasswordVisible1 = !isPasswordVisible1;
                      }),
                      child: isPasswordVisible1
                          ? Icon(FontAwesomeIcons.eye)
                          : Icon(FontAwesomeIcons.eyeSlash),
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  validator: (value) => value != passwordController.text
                      ? "Passwords do not match"
                      : null,
                  controller: confirmPasswordController,
                  obscureText: !isPasswordVisible2,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Color(0xffDEDEDE)),
                    ),
                    fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                    filled: true,
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(color: Color(0xff858383)),
                    suffixIcon: GestureDetector(
                      onTap: () => setState(() {
                        isPasswordVisible2 = !isPasswordVisible2;
                      }),
                      child: isPasswordVisible2
                          ? Icon(FontAwesomeIcons.eye)
                          : Icon(FontAwesomeIcons.eyeSlash),
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    if (_formkey.currentState!.validate())
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavBarScreen(),
                        ),
                      );
                  },
                  child: Container(
                    width: 320.w,
                    height: 54.h,
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color(0xff407BFF),
                      border: Border.all(color: Color(0xffDEDEDE)),
                    ),
                    child: Center(
                      child: Text(
                        "SAVE CHANGES",
                        textAlign: TextAlign.center,
                        style: AppWidget.signUpAndLoginButtonTextStyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
