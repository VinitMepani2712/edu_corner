import 'package:edu_corner/pages/bottom_nav_bar.dart';
import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

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
          padding: EdgeInsets.only(top: 100),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    "Reset Password ",
                    style: AppWidget.headerTextStyle(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Reset Passowrd for Edu Corner",
                    style: AppWidget.normalTextStyle(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your password";
                      }
                      if (value.length < 8) {
                        return "Password must be at least 8 characters long , \n1 Uppercase letter , \n1 Lowercase letter , \n1 Special Character ";
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
                        return "Enter password does not match";
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
                          "SAVE CHANGES",
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
      ),
    );
  }
}
