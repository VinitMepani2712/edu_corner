import 'dart:async';

import 'package:edu_corner/pages/onboardscreen/on_board_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const OnBoardPage()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E74BC),
      body: Center(
        child: Image.asset(
          'assets/onboardscreenimages/logo.png',
          width: double.infinity,
          height: double.infinity,
        ),
      ),
    );
  }
}
