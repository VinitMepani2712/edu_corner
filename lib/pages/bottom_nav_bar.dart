import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottemNavigationBarPage extends StatefulWidget {
  const BottemNavigationBarPage({super.key});

  @override
  State<BottemNavigationBarPage> createState() =>
      _BottemNavigationBarPageState();
}

class _BottemNavigationBarPageState extends State<BottemNavigationBarPage> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late HomePage homePage;
  late ProfilePage profilePage;

  @override
  void initState() {
    homePage = const HomePage();
    profilePage = const ProfilePage();

    pages = [homePage, profilePage];
    super.initState();
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15),
        child: GNav(
            onTabChange: (int index) {
              setState(() {
                currentTabIndex = index;
              });
            },
            haptic: true,
            activeColor: Color.fromRGBO(44, 132, 195, 1),
            iconSize: 24,
            gap: 5,
            tabBackgroundColor: Color.fromRGBO(44, 132, 195, 0.2),
            padding: EdgeInsets.all(7),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              // GButton(
              //   icon: Icons.menu_book_outlined,
              //   text: 'Course',
              // ),
              // GButton(
              //   icon: FontAwesomeIcons.book,
              //   text: 'Books',
              // ),
              // GButton(
              //   icon: Icons.chat,
              //   text: 'Message',
              // ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ]),
      ),
      body: pages[currentTabIndex],
    );
  }
}
