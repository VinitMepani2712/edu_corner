import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:edu_corner/provider/profile_provider.dart';
import 'package:edu_corner/screen/profile/edit_profile_screen.dart';
import 'package:edu_corner/screen/profile/certificate_screen.dart';
import 'package:edu_corner/screen/profile/project_screen.dart';
import 'package:edu_corner/screen/profile/help_and_support_screen.dart';
import 'package:edu_corner/screen/profile/privacy_policy.dart';
import 'package:edu_corner/screen/profile/download_screen.dart';
import 'package:edu_corner/screen/Auth/log_in_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileProvider _profileProvider;

  @override
  void initState() {
    super.initState();
    _profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    _profileProvider.getUserName();
    _profileProvider.getUserEmail();
    _profileProvider.getUserMobileNumber();
    _profileProvider.getUserGender();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: AppWidget.appbarTextStyle(),
        ),
      ),
      body:
          Consumer<ProfileProvider>(builder: (context, profileProvider, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileInfo(profileProvider),
              _buildEditProfileButton(),
              _buildSectionItem(
                icon: FontAwesomeIcons.book,
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "All saved Courses",
                onTap: () {},
              ),
              _buildSectionItem(
                icon: "assets/svg/certificate.svg",
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "My Certificates",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CertificatePage()),
                  );
                },
              ),
              _buildSectionItem(
                icon: "assets/svg/chart.svg",
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "My Projects",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProjectPage()),
                  );
                },
              ),
              _buildSectionItem(
                icon: "assets/svg/payment.svg",
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "Payment Methods",
                onTap: () {},
              ),
              _buildSectionItem(
                icon: "assets/svg/headphones.svg",
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "Help & Support",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HelpAndSupportPage()),
                  );
                },
              ),
              _buildSectionItem(
                icon: "assets/svg/privacy-tips.svg",
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "Privacy Policy",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PrivacyPolicayPage()),
                  );
                },
              ),
              _buildSectionItem(
                icon: "assets/svg/download.svg",
                iconColor: Color.fromARGB(255, 59, 168, 247),
                label: "My Downloads",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DownloadPage()),
                  );
                },
              ),
              _buildLogoutButton(),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildProfileInfo(ProfileProvider profileProvider) {
    return Container(
      margin: EdgeInsets.all(20),
      height: 76,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(228, 239, 247, 0.38),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            CircleAvatar(
              minRadius: 30,
              maxRadius: 30,
              backgroundImage: profileProvider.image == null
                  ? AssetImage(profileProvider.photoURL) as ImageProvider
                  : FileImage(profileProvider.image!),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_profileProvider.name ?? ''),
                  Text(_profileProvider.email ?? ''),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditProfilePage()),
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
            "EDIT PROFILE",
            textAlign: TextAlign.center,
            style: AppWidget.signUpAndLoginButtonTextStyle(),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionItem({
    required dynamic icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  child: icon is String
                      ? SvgPicture.asset(
                          icon,
                          colorFilter:
                              ColorFilter.mode(iconColor, BlendMode.srcIn),
                          height: 25,
                          width: 25,
                        )
                      : Icon(
                          icon,
                          color: iconColor,
                        ),
                ),
              ),
              SizedBox(width: 20),
              Text(label),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_right_rounded,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
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
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Are you sure you want to logout?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff726E6E),
                    ),
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
                              color: Color(0xff0E74BC),
                              width: 2.0,
                            ),
                          ),
                          child: Center(child: Text("Cancel")),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()),
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff0E74BC),
                          ),
                          child: Center(
                            child: Text(
                              "Logout",
                              style: TextStyle(color: Colors.white),
                            ),
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
        margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 15),
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
    );
  }
}
