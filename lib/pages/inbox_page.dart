import 'package:edu_corner/pages/chat/chat_screen_page.dart';
import 'package:edu_corner/widget/widget_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Inbox",
            style: AppWidget.appbarTextStyle(),
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      decoration: InputDecoration(
                        focusColor: Color(0xff0E74BC),
                        hoverColor: Color(0xff0E74BC),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(05),
                            borderSide: BorderSide(
                                color: Color(0xff0E74BC), width: 2.0)),
                        hintText: "Search",
                        hintStyle: AppWidget.searchTextStyle(),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff0E74BC),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(05),
                            borderSide: BorderSide(
                                color: Color(0xff0E74BC), width: 2.0)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TabBar(
                            // labelPadding: EdgeInsets.only(left: 15),
                            labelColor: Colors.white,
                            dividerColor: Colors.transparent,
                            indicator: BoxDecoration(
                              shape: BoxShape.rectangle,
                              border: Border.all(color: Colors.transparent),
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff0E74BC),
                            ),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return Color.fromARGB(0, 0, 0, 0);
                                }
                                return Color.fromARGB(0, 0, 0, 0);
                              },
                            ),

                            tabs: [
                              Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xff0E74BC), width: 2.0),
                                  ),
                                  child: Tab(text: 'Conversation')),
                              Container(
                                  height: 40,
                                  width: 130,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Color(0xff0E74BC), width: 2.0),
                                  ),
                                  child: Tab(text: 'Calls')),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 35,
                                              maxRadius: 35,
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            // Positioned(
                                            //     top: 20,
                                            //     bottom: 0,
                                            //     left: 45,
                                            //     right: 0,
                                            //     child: SvgPicture.asset(
                                            //       "assets/svg/pin.svg",
                                            //       color: Color(0xff0E74BC),
                                            //     )),
                                          ],
                                        ),
                                        title: Text('Mike Tyson'),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ChatScreenPage()));
                                        },
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 35,
                                              maxRadius: 35,
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 45,
                                              right: 0,
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Text('Mike Tyson'),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            Badge(
                                              label: Text("5"),
                                              largeSize: 20,
                                              smallSize: 20,
                                              child: CircleAvatar(
                                                minRadius: 35,
                                                maxRadius: 35,
                                                foregroundImage: AssetImage(
                                                    "assets/screen/profile.png"),
                                              ),
                                              backgroundColor:
                                                  Color(0xff0E74BC),
                                              textColor: Colors.white,
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 45,
                                              right: 0,
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Row(children: [
                                          Text('Mike Tyson'),
                                        ]),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 35,
                                              maxRadius: 35,
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 45,
                                              right: 0,
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Row(
                                          children: [
                                            Text('Mike Tyson'),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Badge(
                                              label: Text("5"),
                                              largeSize: 20,
                                              smallSize: 20,
                                              backgroundColor:
                                                  Color(0xff0E74BC),
                                              textColor: Colors.white,
                                            )
                                          ],
                                        ),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 35,
                                              maxRadius: 35,
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 45,
                                              right: 0,
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Text('Mike Tyson'),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 35,
                                              maxRadius: 35,
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 45,
                                              right: 0,
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Text('Mike Tyson'),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: Stack(
                                          children: [
                                            CircleAvatar(
                                              minRadius: 35,
                                              maxRadius: 35,
                                              foregroundImage: AssetImage(
                                                  "assets/screen/profile.png"),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              left: 45,
                                              right: 0,
                                              child: Icon(
                                                Icons.circle,
                                                color: Colors.green,
                                                size: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                        title: Text('Mike Tyson'),
                                        subtitle: Text('Ok thanks'),
                                        trailing: Text("30 mins ago"),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                    ],
                                  ),
                                ),
                                // Calls Tab Content
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: CircleAvatar(
                                          minRadius: 35,
                                          maxRadius: 35,
                                          foregroundImage: AssetImage(
                                              "assets/screen/profile.png"),
                                        ),
                                        title: Text('Mike Tyson (3)'),
                                        subtitle: Row(children: [
                                          Icon(
                                            Icons.arrow_outward_outlined,
                                            color: Colors.green,
                                          ),
                                          Text('Yesterday, 11:04 pm')
                                        ]),
                                        trailing: Icon(
                                          Icons.call,
                                          color: Color(0xff0E74BC),
                                        ),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: CircleAvatar(
                                          minRadius: 35,
                                          maxRadius: 35,
                                          foregroundImage: AssetImage(
                                              "assets/screen/profile.png"),
                                        ),
                                        title: Text('Mike Tyson (3)'),
                                        subtitle: Row(children: [
                                          Icon(
                                            Icons.arrow_outward_outlined,
                                            color: Colors.green,
                                          ),
                                          Text('Yesterday, 11:04 pm')
                                        ]),
                                        trailing: Icon(
                                          Icons.call,
                                          color: Color(0xff0E74BC),
                                        ),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: CircleAvatar(
                                          minRadius: 35,
                                          maxRadius: 35,
                                          foregroundImage: AssetImage(
                                              "assets/screen/profile.png"),
                                        ),
                                        title: Text('Mike Tyson (3)'),
                                        subtitle: Row(children: [
                                          Icon(
                                            Icons.arrow_outward_outlined,
                                            color: Colors.green,
                                          ),
                                          Text('Yesterday, 11:04 pm')
                                        ]),
                                        trailing: Icon(
                                          Icons.call,
                                          color: Color(0xff0E74BC),
                                        ),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),
                                      ListTile(
                                        contentPadding: EdgeInsets.only(
                                            left: 05, right: 05),
                                        leading: CircleAvatar(
                                          minRadius: 35,
                                          maxRadius: 35,
                                          foregroundImage: AssetImage(
                                              "assets/screen/profile.png"),
                                        ),
                                        title: Text(
                                          'Mike Tyson (3)',
                                          style: AppWidget.missCallTextStyle(),
                                        ),
                                        subtitle: Row(children: [
                                          SvgPicture.asset(
                                            "assets/svg/arrow-down-left.svg",
                                            color: Colors.red,
                                          ),
                                          Text('Yesterday, 11:04 pm')
                                        ]),
                                        trailing: Icon(
                                          Icons.call,
                                          color: Color(0xff0E74BC),
                                        ),
                                        onTap: () {},
                                      ),
                                      Divider(
                                        color: Color(0xffE8F1FF),
                                      ),

                                      // Add more list tiles as needed
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
