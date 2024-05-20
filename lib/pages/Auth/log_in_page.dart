import 'package:edu_corner/pages/bottombar/bottom_nav_bar.dart';
import 'package:edu_corner/pages/Auth/forgot_password_page.dart';
import 'package:edu_corner/pages/Auth/sign_up_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible1 = false;
  bool isChecked = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100.h, horizontal: 15.w),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back!",
                  style: AppWidget.headerTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Login to Edu Corner",
                  style: AppWidget.normalTextStyle(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "\u274C Please enter your email address";
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return '\u274C Please enter a valid email address';
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
                    hintText: "Email Address",
                    hintStyle: TextStyle(color: Color(0xff858383)),
                    suffixIcon: Icon(FontAwesomeIcons.envelope),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 20.h),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "\u274C Enter your password";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: !isPasswordVisible1,
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
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xff858383)),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isPasswordVisible1 = !isPasswordVisible1;
                        });
                      },
                      child: isPasswordVisible1
                          ? Icon(FontAwesomeIcons.eye)
                          : Icon(FontAwesomeIcons.eyeSlash),
                    ),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Colors.black),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('Remember Me'),
                        value: isChecked,
                        onChanged: (newValue) {
                          setState(() {
                            isChecked = newValue ?? false;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ForgotPasswordPage()),
                            ),
                          );
                        },
                        child: Text("Forgot Password?"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate())
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => BottomNavBarPage()),
                        ),
                      );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    width: 320.w,
                    height: 54.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff407BFF),
                      border: Border.all(color: const Color(0xffDEDEDE)),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: AppWidget.signUpAndLoginButtonTextStyle(),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 40.h,
                  color: Color(0xffD1D3D4),
                  indent: 20.w,
                  endIndent: 20.w,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 320.w,
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffFFFFFF),
                    border: Border.all(color: const Color(0xffDEDEDE)),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Sign In with Google",
                      style: TextStyle(
                        color: Color.fromARGB(255, 189, 185, 185),
                      ),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.google,
                      color: Color.fromARGB(255, 189, 185, 185),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 320.w,
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff407BFF),
                    border: Border.all(color: const Color(0xffDEDEDE)),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Sign In with Facebook",
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 320.w,
                  height: 54.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xff000000),
                    border: Border.all(color: const Color(0xffDEDEDE)),
                  ),
                  child: TextButton.icon(
                    onPressed: () {},
                    label: Text(
                      "Continue with Apple",
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                    icon: Icon(
                      FontAwesomeIcons.apple,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Are you new here?",
                        style: TextStyle(
                          color: Color(0xFF6C6C6C),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        " Sign Up Now",
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
          ),
        ),
      ),
    );
  }
}
