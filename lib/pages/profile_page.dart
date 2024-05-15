import 'package:edu_corner/pages/edit_profile_page.dart';
import 'package:edu_corner/pages/log_in_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // GestureDetector(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: Icon(Icons.arrow_back)),
            // SizedBox(
            //   width: 20,
            // ),
            Text(
              "Settings",
              style: AppWidget.appbarTextStyle(),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              height: 76,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(228, 239, 247, 0.38)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      minRadius: 30,
                      maxRadius: 30,
                      foregroundImage: AssetImage("assets/screen/profile.png"),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sara Rehman"),
                          Text("sara123@gmail.com"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                width: 320,
                height: 54,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xff407BFF),
                  border: Border.all(color: const Color(0xffDEDEDE)),
                ),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "EDIT PROFILE",
                    style: AppWidget.signUpAndLoginButtonTextStyle(),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 15),
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(228, 239, 247, 0.38),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(108, 129, 187, 228),
                        child: Icon(
                          FontAwesomeIcons.book,
                          color: Color.fromARGB(255, 59, 168, 247),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text("All saved Courses"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(228, 239, 247, 0.38),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: SvgPicture.asset(
                            "assets/svg/certificate.svg",
                            // ignore: deprecated_member_use
                            color: Color.fromARGB(255, 59, 168, 247),
                          )),
                    ),
                    SizedBox(width: 20),
                    Text("My Certificates"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.4,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(228, 239, 247, 0.38),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: SvgPicture.asset(
                            "assets/svg/chart.svg",
                            height: 20, // ignore: deprecated_member_use
                            color: Color.fromARGB(255, 59, 168, 247),
                          )),
                    ),
                    SizedBox(width: 20),
                    Text("My Projects"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.8,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(228, 239, 247, 0.38),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: SvgPicture.asset(
                            "assets/svg/payment.svg",
                            // ignore: deprecated_member_use
                            color: Color.fromARGB(255, 59, 168, 247),
                          )),
                    ),
                    SizedBox(width: 20),
                    Text("Payment Methods"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(228, 239, 247, 0.38),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: SvgPicture.asset(
                            "assets/svg/headphones.svg",
                            // ignore: deprecated_member_use
                            color: Color.fromARGB(255, 59, 168, 247),
                          )),
                    ),
                    SizedBox(width: 20),
                    Text("Help & Support"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.3,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 76,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(228, 239, 247, 0.38),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: SvgPicture.asset(
                            "assets/svg/privacy-tips.svg",
                            // height: 20, // ignore: deprecated_member_use
                            color: Color.fromARGB(255, 59, 168, 247),
                          )),
                    ),
                    SizedBox(width: 20),
                    Text("Privacy Policy"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.3,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 10),
              height: 76,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(228, 239, 247, 0.38)),
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xff74BFF5),
                          width: 3.0,
                        ),
                      ),
                      child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: SvgPicture.asset(
                            "assets/svg/download.svg",
                            // ignore: deprecated_member_use
                            color: Color.fromARGB(255, 59, 168, 247),
                          )),
                    ),
                    SizedBox(width: 20),
                    Text("My Downloads"),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3.3,
                    ),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Are  you sure you want to logout?",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff726E6E)),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xff0E74BC), width: 2.0),
                                  ),
                                  child: Center(child: Text("Cancel")),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xff0E74BC),
                                  ),
                                  child: Center(
                                    child: Text("Logout",
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                margin:
                    EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
                height: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromRGBO(228, 239, 247, 0.38),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xff74BFF5),
                            width: 3.0,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Color.fromARGB(108, 129, 187, 228),
                          child: Icon(
                            Icons.logout,
                            color: Color.fromARGB(255, 59, 168, 247),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text("Logout"),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.3,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
