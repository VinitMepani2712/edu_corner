import 'package:flutter/material.dart';

class AppWidget {
  static TextStyle textStyle() {
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      fontFamily: "Plus Jakarta Sans",
      color: Color(0xFF0E74BC),
    );
  }

  static TextStyle lightTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: "Plus Jakarta Sans",
      color: Color(0xFF6C6C6C),
    );
  }

  static TextStyle buttonTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle signUpAndLoginButtonTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
  }

  static TextStyle headerTextStyle() {
    return const TextStyle(
      fontSize: 28,
      fontFamily: "Times New Roman",
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
  }

  static TextStyle normalTextStyle() {
    return const TextStyle(
      fontSize: 16,
      fontFamily: "Times New Roman",
      fontWeight: FontWeight.w700,
      color: Colors.black,
    );
  }

  static TextStyle courseHeaderTextStyle() {
    return const TextStyle(
      fontSize: 14,
      fontFamily: "Times New Roman",
      fontWeight: FontWeight.w700,
      color: Color.fromARGB(255, 0, 0, 0),
    );
  }

  static TextStyle priceTextStyle() {
    return const TextStyle(
      fontSize: 13,
      fontFamily: "Times New Roman",
      fontWeight: FontWeight.w500,
      color: Color(0xff0E74BC),
    );
  }

  static TextStyle courseLightTextStyle() {
    return const TextStyle(
      fontSize: 13,
      fontFamily: "Times New Roman",
      fontWeight: FontWeight.w600,
      color: Color(0xff9A9998),
    );
  }
}
