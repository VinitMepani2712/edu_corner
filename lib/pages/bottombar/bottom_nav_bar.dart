import 'package:edu_corner/pages/bookmarks_page.dart';
import 'package:edu_corner/pages/course_page.dart';
import 'package:edu_corner/pages/home_page.dart';
import 'package:edu_corner/pages/inbox_page.dart';
import 'package:edu_corner/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key});

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int currentTabIndex = 0;
  late List<Widget> pages;
  late HomeScreen homePage;
  late MyCoursePage mycoursepage;
  late InboxPage inboxPage;
  late ProfilePage profilePage;
  late BookmarksPage bookmarksPage;

  @override
  void initState() {
    homePage = HomeScreen();
    mycoursepage = const MyCoursePage();
    bookmarksPage = const BookmarksPage();
    inboxPage = const InboxPage();
    profilePage = const ProfilePage();

    pages = [homePage, mycoursepage, bookmarksPage, inboxPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(15.w),
        child: GNav(
          onTabChange: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          haptic: true,
          activeColor: Color.fromRGBO(44, 132, 195, 1),
          iconSize: 24.sp,
          gap: 5.w,
          tabBackgroundColor: Color.fromRGBO(44, 132, 195, 0.2),
          padding: EdgeInsets.all(7.w),
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
          ],
          selectedIndex: currentTabIndex,
        ),
      ),
      body: pages[currentTabIndex],
    );
  }
}
