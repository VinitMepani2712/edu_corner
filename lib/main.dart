import 'package:edu_corner/pages/bottombar/bottom_nav_bar.dart';

import 'package:edu_corner/provider/homes_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProviderScreen(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            textTheme: GoogleFonts.plusJakartaSansTextTheme(
                Theme.of(context).textTheme),
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255),
            ),
            useMaterial3: true,
          ),
          home: BottomNavBarPage(),
        );
      },
    );
  }
}
