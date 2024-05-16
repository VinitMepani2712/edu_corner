import 'package:edu_corner/pages/bookmarks_page.dart';
import 'package:edu_corner/pages/course_page.dart';
import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/pages/inbox_page.dart';
import 'package:edu_corner/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottemNavBarPage extends StatefulWidget {
  const BottemNavBarPage({super.key});

  @override
  State<BottemNavBarPage> createState() => _BottemNavBarPageState();
}

class _BottemNavBarPageState extends State<BottemNavBarPage> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late HomePage homePage;
  late MyCoursePage mycoursepage;
  late InboxPage inboxPage;
  late ProfilePage profilePage;
  late BookmarksPage bookmarksPage;

  @override
  void initState() {
    homePage = const HomePage();
    mycoursepage = const MyCoursePage();
    bookmarksPage = const BookmarksPage();
    inboxPage = const InboxPage();
    profilePage = const ProfilePage();

    pages = [homePage, mycoursepage, bookmarksPage, inboxPage, profilePage];
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
              GButton(
                icon: Icons.menu_book_outlined,
                text: 'My Course',
              ),
              GButton(
                icon: FontAwesomeIcons.book,
                text: 'Bookmarks',
              ),
              GButton(
                icon: Icons.chat,
                text: 'Inbox',
              ),
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