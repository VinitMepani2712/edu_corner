import 'package:edu_corner/pages/log_in_page.dart';
import 'package:edu_corner/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widget/content_modal.dart';
import '../widget/widget_support.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  int currentIndex = 0;
  late PageController _controller = PageController();

  void inState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 40, left: 20, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.asset(
                                contents[i].image,
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              contents[i].title,
                              textAlign: TextAlign.center,
                              style: AppWidget.textStyle(),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              contents[i].description,
                              textAlign: TextAlign.center,
                              style: AppWidget.lightTextStyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (i < contents.length - 1)
                      Positioned(
                        top: 45,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            _controller.animateToPage(
                              contents.length - 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            width: 60,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0E74BC),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                "SKIP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: buildDot(index, context),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              if (currentIndex == contents.length - 1) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => const SignUpPage()),
                // );
              }
              _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (currentIndex > 0 && currentIndex < contents.length - 1)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = currentIndex - 1;
                        });
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceOut,
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF0E74BC),
                            width: 2,
                          ),
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          textAlign: TextAlign.center,
                          "BACK",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  if (currentIndex == contents.length - 1)
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //Add Explore Course Page Route
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0E74BC),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              textAlign: TextAlign.center,
                              "EXPLORE COURSE",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF0E74BC),
                                width: 2,
                              ),
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              textAlign: TextAlign.center,
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Color(0xFF6C6C6C),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                " Login Now",
                                style: TextStyle(
                                  color: Color(0xFF0E74BC),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  if (currentIndex <
                      contents.length -
                          1) // Show next button on pages 1 to (last - 1)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          currentIndex = currentIndex + 1;
                        });
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.bounceIn,
                        );
                      },
                      child: Center(
                        child: Container(
                          width: currentIndex == 0
                              ? MediaQuery.of(context).size.width / 1.5
                              : MediaQuery.of(context).size.width / 2.5,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: currentIndex == 0
                                ? const Color(0xFF0E74BC)
                                : const Color(0xFF0E74BC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "NEXT",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: currentIndex == 0
                                  ? Colors.white
                                  : const Color(0xFFFFFFFF),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 75,
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 2.0,
      width: currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: currentIndex == index ? const Color(0xFF0E74BC) : Colors.grey,
      ),
    );
  }
}
