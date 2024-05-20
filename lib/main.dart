import 'package:edu_corner/pages/bottombar/bottom_nav_bar.dart';
import 'package:edu_corner/pages/course_details/course_details_page.dart';
import 'package:edu_corner/pages/home/cart_screen.dart';
import 'package:edu_corner/pages/payment/first_checkout_screen.dart';
import 'package:edu_corner/pages/splash_screen.dart';

import 'package:flutter/material.dart';

import 'pages/chat/chat_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      home: FirstCheckoutScreen(),
    );
  }
}
