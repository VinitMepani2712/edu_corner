import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';

class PrivacyPolicayPage extends StatefulWidget {
  const PrivacyPolicayPage({super.key});

  @override
  State<PrivacyPolicayPage> createState() => _PrivacyPolicayPageState();
}

class _PrivacyPolicayPageState extends State<PrivacyPolicayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("1. Types data we collect",
                  style: AppWidget.normalTextStyle()),
              SizedBox(height: 10),
              Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."""),
              SizedBox(height: 20),
              Text(
                "2. Use of your personal data",
                style: AppWidget.normalTextStyle(),
              ),
              SizedBox(height: 10),
              Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."""),
              SizedBox(height: 20),
              Text("3. Disclosure of your personal data",
                  style: AppWidget.normalTextStyle()),
              SizedBox(height: 10),
              Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n
Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."""),
            ],
          ),
        ),
      ),
    );
  }
}
