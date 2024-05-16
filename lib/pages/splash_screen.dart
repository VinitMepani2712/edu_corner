import 'dart:async';

import 'package:edu_corner/pages/onboardscreen/on_board_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
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
