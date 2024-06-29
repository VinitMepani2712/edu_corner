import 'package:edu_corner/provider/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:edu_corner/widget/widget_support.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final ProfileProvider _profileProvider = ProfileProvider();

  @override
  void initState() {
    super.initState();
    _profileProvider.fetchUserProfile();
  }

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
        child: _buildProfileForm(),
      ),
    );
  }

  Widget _buildProfileForm() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Consumer<ProfileProvider>(
        builder: (context, profileProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProfileImage(profileProvider),
              SizedBox(height: 8),
              _buildProfileField("Name", profileProvider.name ?? ''),
              SizedBox(height: 8),
              _buildProfileField("Email Address", profileProvider.email ?? ''),
              SizedBox(height: 8),
              _buildProfileField("Password", "*************"),
              SizedBox(height: 20),
              _buildActionButtons(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileImage(ProfileProvider profileProvider) {
    return Center(
      child: GestureDetector(
        onTap: () => profileProvider.pickImage(),
        child: Stack(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: profileProvider.image == null
                  ? AssetImage(profileProvider.photoURL) as ImageProvider
                  : FileImage(profileProvider.image!),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Color(0xFF0E74BC),
                  child: Icon(
                    FontAwesomeIcons.camera,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Container(
      height: 65,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(228, 239, 247, 0.38),
        border: Border.all(color: Color(0xff858383), width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, top: 20),
        child: Text(value),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildActionButton(
              "Enrolled Courses",
              "assets/svg/book-open.svg",
              Color(0xff0E74BC),
            ),
            _buildActionButton(
              "Bookmarks",
              "assets/svg/bookclose.svg",
              Color(0xff858383),
            ),
          ],
        ),
        SizedBox(height: 25),
        _buildSaveChangesButton(),
      ],
    );
  }

  Widget _buildActionButton(String label, String iconPath, Color iconColor) {
    return Container(
      height: 190,
      width: MediaQuery.of(context).size.width / 2 - 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromRGBO(228, 239, 247, 0.38),
        border: Border.all(color: Color(0xff858383), width: 2),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              height: 100,
              color: iconColor,
            ),
            SizedBox(height: 15),
            Text(
              label,
              style: AppWidget.editProfileTextStyle(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveChangesButton() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      width: 320,
      height: 54,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xff407BFF),
        border: Border.all(color: const Color(0xffDEDEDE)),
      ),
      child: TextButton(
        onPressed: () async {
          await _profileProvider.updateProfile();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Profile updated successfully'),
            ),
          );
        },
        child: Text(
          "Save Changes",
          style: AppWidget.signUpAndLoginButtonTextStyle(),
        ),
      ),
    );
  }
}
