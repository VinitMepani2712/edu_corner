import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreenPage extends StatefulWidget {
  const ChatScreenPage({super.key});

  @override
  State<ChatScreenPage> createState() => _ChatScreenPageState();
}

class _ChatScreenPageState extends State<ChatScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  minRadius: 25,
                  maxRadius: 25,
                  foregroundImage: AssetImage("assets/screen/profile.png"),
                ),
                Positioned(
                  bottom: 0,
                  left: 35,
                  right: 0,
                  child: Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 20,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mike Tyson",
                  style: AppWidget.appbarTextStyle(),
                ),
                Text(
                  "Online",
                  style: AppWidget.courseLightTextStyle(),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            Icon(
              Icons.call,
              color: Color(0xff0E74BC),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.camera_alt,
              color: Color(0xff0E74BC),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10.0, top: 30, right: 10, bottom: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
              ),
              TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(color: Color(0xff0E74BC)),
                  ),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xff0E74BC))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xff0E74BC))),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color: Color(0xff0E74BC))),
                  fillColor: Color.fromRGBO(64, 123, 255, 0.03),
                  filled: true,
                  hintText: "Write a message",
                  prefixIcon: Icon(FontAwesomeIcons.faceSmile,
                      color: Color(0xff0E74BC)),
                  suffixIcon: Icon(Icons.send, color: Color(0xff0E74BC)),
                  hintStyle: TextStyle(color: Color(0xff858383)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
