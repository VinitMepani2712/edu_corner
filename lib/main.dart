// import 'package:edu_corner/pages/log_in_page.dart';
// import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/pages/on_board_page.dart';
// import 'package:edu_corner/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

// import 'pages/splash_screen.dart';

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
      home: HomePage(),
    );
  }
}
