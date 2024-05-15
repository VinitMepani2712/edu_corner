import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: AppWidget.appbarTextStyle(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                        minRadius: 75,
                        maxRadius: 75,
                        foregroundImage:
                            AssetImage("assets/screen/profile.png")),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 100,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: Color(0xff0E74BC),
                      child: Icon(
                        Icons.camera_alt,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 08),
              Text("Name:"),
              SizedBox(height: 08),
              Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(228, 239, 247, 0.38),
                    border: Border.all(color: Color(0xff858383), width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 20),
                  child: Text("Sara Rehman "),
                ),
              ),
              SizedBox(height: 08),
              Text("Email Address:"),
              SizedBox(height: 08),
              Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(228, 239, 247, 0.38),
                    border: Border.all(color: Color(0xff858383), width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 20),
                  child: Text("sara123@gmail.com"),
                ),
              ),
              SizedBox(height: 08),
              Text("Password:"),
              SizedBox(height: 08),
              Container(
                height: 65,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromRGBO(228, 239, 247, 0.38),
                    border: Border.all(color: Color(0xff858383), width: 2)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, top: 20),
                  child: Text("*************"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FittedBox(
                child: Row(
                  children: [
                    Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color.fromRGBO(228, 239, 247, 0.38),
                          border:
                              Border.all(color: Color(0xff858383), width: 2)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/book-open.svg",
                              height: 100,
                              color: Color(0xff0E74BC),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Enrolled Courses",
                              style: AppWidget.editProfileTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 190,
                      width: MediaQuery.of(context).size.width / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xffFFFFFF),
                          border:
                              Border.all(color: Color(0xff858383), width: 2)),
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/bookclose.svg",
                              height: 100,
                              color: Color(0xff858383),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Bookmarks",
                              style: AppWidget.editProfileTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
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
                    "Save Changes",
                    style: AppWidget.signUpAndLoginButtonTextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
