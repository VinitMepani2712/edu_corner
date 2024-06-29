import 'package:edu_corner/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:edu_corner/pages/Auth/log_in_page.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AuthenticationProvider>(
        create: (context) => AuthenticationProvider(),
        child: Consumer<AuthenticationProvider>(
          builder: (context, authProvider, child) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        children: [
                          _buildHeaderText(),
                          SizedBox(height: 20.h),
                          _buildSubtitleText(),
                          SizedBox(height: 20.h),
                          _buildNameField(authProvider),
                          SizedBox(height: 20.h),
                          _buildEmailField(authProvider),
                          SizedBox(height: 20.h),
                          _buildPasswordField(authProvider),
                          SizedBox(height: 20.h),
                          _buildConfirmPasswordField(authProvider),
                          SizedBox(height: 20.h),
                          _buildSignUpButton(authProvider, context),
                          _buildDivider(),
                          _buildGoogleSignInButton(authProvider),
                          SizedBox(height: 20.h),
                          _buildFacebookSignInButton(authProvider),
                          SizedBox(height: 20.h),
                          _buildAppleSignInButton(authProvider),
                          SizedBox(height: 20.h),
                          _buildLoginRedirect(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeaderText() {
    return Text(
      "Welcome",
      textAlign: TextAlign.center,
      style: AppWidget.headerTextStyle(),
    );
  }

  Widget _buildSubtitleText() {
    return Text(
      "Sign Up to Edu Corner",
      textAlign: TextAlign.center,
      style: AppWidget.normalTextStyle(),
    );
  }

  Widget _buildNameField(AuthenticationProvider authProvider) {
    return TextFormField(
      controller: authProvider.nameController,
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter your name' : null,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        fillColor: Color.fromRGBO(64, 123, 255, 0.03),
        filled: true,
        hintText: "Name",
        hintStyle: TextStyle(color: Color(0xff858383)),
        suffixIcon: Icon(Icons.person),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildEmailField(AuthenticationProvider authProvider) {
    return TextFormField(
      controller: authProvider.emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email address';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email address';
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        fillColor: Color.fromRGBO(64, 123, 255, 0.03),
        filled: true,
        hintText: "Email",
        hintStyle: TextStyle(color: Color(0xff858383)),
        suffixIcon: Icon(FontAwesomeIcons.envelope),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildPasswordField(AuthenticationProvider authProvider) {
    return TextFormField(
      controller: authProvider.passwordController,
      obscureText: !authProvider.isPasswordVisible,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter your password";
        }
        if (value.length < 8) {
          return "Password must be at least 8 characters long";
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        fillColor: Color.fromRGBO(64, 123, 255, 0.03),
        filled: true,
        hintText: "Password",
        hintStyle: TextStyle(color: Color(0xff858383)),
        suffixIcon: GestureDetector(
          onTap: () => authProvider.togglePasswordVisibility(),
          child: authProvider.isPasswordVisible
              ? Icon(FontAwesomeIcons.eye)
              : Icon(FontAwesomeIcons.eyeSlash),
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildConfirmPasswordField(AuthenticationProvider authProvider) {
    return TextFormField(
      controller: authProvider.confirmPasswordController,
      obscureText: !authProvider.isConfirmPasswordVisible,
      validator: (value) {
        if (value != authProvider.passwordController.text) {
          return "Entered password does not match";
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Color(0xffDEDEDE)),
        ),
        fillColor: Color.fromRGBO(64, 123, 255, 0.03),
        filled: true,
        hintText: "Confirm Password",
        hintStyle: TextStyle(color: Color(0xff858383)),
        suffixIcon: GestureDetector(
          onTap: () => authProvider.toggleConfirmPasswordVisibility(),
          child: authProvider.isConfirmPasswordVisible
              ? Icon(FontAwesomeIcons.eye)
              : Icon(FontAwesomeIcons.eyeSlash),
        ),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.black),
    );
  }

  Widget _buildSignUpButton(
      AuthenticationProvider authProvider, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          authProvider.setEmail(authProvider.emailController.text);
          authProvider.setPassword(authProvider.passwordController.text);
          authProvider.setName(authProvider.nameController.text);
          authProvider.registration(context, authProvider.isChecked);
        }
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
            "SIGN UP",
            textAlign: TextAlign.center,
            style: AppWidget.signUpAndLoginButtonTextStyle(),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 40.h,
      color: Color(0xffD1D3D4),
      indent: 20.w,
      endIndent: 20.w,
    );
  }

  Widget _buildGoogleSignInButton(AuthenticationProvider authProvider) {
    return _buildSocialLoginButton(
      context: context,
      color: Colors.white,
      icon: FontAwesomeIcons.google,
      label: "Sign In with Google",
      onPressed: () => authProvider.signInWithGoogle(context),
    );
  }

  Widget _buildFacebookSignInButton(AuthenticationProvider authProvider) {
    return _buildSocialLoginButton(
      context: context,
      color: Color(0xff407BFF),
      icon: FontAwesomeIcons.facebook,
      label: "Sign In with Facebook",
      onPressed: () {},
    );
  }

  Widget _buildAppleSignInButton(AuthenticationProvider authProvider) {
    return _buildSocialLoginButton(
      context: context,
      color: Colors.black,
      icon: FontAwesomeIcons.apple,
      label: "Continue with Apple",
      onPressed: () {},
    );
  }

  Widget _buildLoginRedirect() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account?",
              style: TextStyle(
                color: Color(0xFF6C6C6C),
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            Text(
              " Login Now",
              style: TextStyle(
                color: Color(0xFF0E74BC),
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialLoginButton({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      width: 320.w,
      height: 54.h,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
        border: Border.all(color: const Color(0xffDEDEDE)),
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: Icon(icon,
            color: color == Colors.white ? Colors.black : Colors.white),
        label: Text(
          label,
          style: TextStyle(
            color: color == Colors.white ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }
}
