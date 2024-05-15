import 'package:edu_corner/pages/bottom_nav_bar.dart';
import 'package:edu_corner/pages/log_in_page.dart';
import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isIconPressed = true;
  bool isPasswordVisible1 = false;
  bool isPasswordVisible2 = false;
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome",
                    style: AppWidget.headerTextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Sign Up to Edu Corner",
                    style: AppWidget.normalTextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '\u274C Please enter your name';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                      filled: true,
                      hintText: "Name",
                      hintStyle: TextStyle(color: Color(0xff858383)),
                      suffixIcon: Icon(
                        Icons.person,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '\u274C Please enter your email address';
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
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                      filled: true,
                      hintText: "Email",
                      hintStyle: TextStyle(color: Color(0xff858383)),
                      suffixIcon: Icon(
                        FontAwesomeIcons.envelope,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "\u274C Enter your password";
                      }
                      if (value.length < 8) {
                        return "\u274C Password must be at least 8 characters long , 1 Uppercase letter , 1 Lowercase letter , 1 Special Character ";
                      }
                      return null;
                    },
                    controller: passwordController,
                    obscureText: !isPasswordVisible1,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
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
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value != passwordController) {
                        return "\u274C Enter password does not match";
                      }

                      return null;
                    },
                    controller: confirmPasswordController,
                    obscureText: !isPasswordVisible2,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color((0xffDEDEDE)))),
                      fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                      filled: true,
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Color(0xff858383)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible2 = !isPasswordVisible2;
                          });
                        },
                        child: isPasswordVisible2
                            ? Icon(FontAwesomeIcons.eye)
                            : Icon(FontAwesomeIcons.eyeSlash),
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formkey.currentState!.validate())
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BottemNavigationBarPage(),
                          ),
                        );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      width: 320,
                      height: 54,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xff407BFF),
                        border: Border.all(color: const Color(0xffDEDEDE)),
                      ),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          "SIGN UP",
                          style: AppWidget.signUpAndLoginButtonTextStyle(),
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 40,
                    color: Color(0xffD1D3D4),
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 320,
                    height: 54,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffFFFFFF),
                      border: Border.all(color: const Color(0xffDEDEDE)),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Sign In with Google ",
                        style: TextStyle(
                            color: Color.fromARGB(255, 189, 185, 185)),
                      ),
                      icon: Icon(
                        FontAwesomeIcons.google,
                        color: Color.fromARGB(
                          255,
                          189,
                          185,
                          185,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 320,
                    height: 54,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff407BFF),
                      border: Border.all(color: const Color(0xffDEDEDE)),
                    ),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Sign In with Facebook ",
                        style: TextStyle(color: Color(0xffFFFFFF)),
                      ),
                      icon: Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: 320,
                    height: 54,
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: Color(0xFF6C6C6C),
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            " Login Now",
                            style: TextStyle(
                              color: Color(0xFF0E74BC),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
