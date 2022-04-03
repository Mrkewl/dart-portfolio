import 'package:flutter/material.dart';

import 'package:portfolio/screens/project_screen.dart';

import 'introduction_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161853),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          scrollDirection: Axis.vertical,
          children: [
            const IntroductionPage(),
            Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.abc), label: 'Projects'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.abc), label: 'Projects'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.abc), label: 'Projects'),
                ],
                onTap: (index) {},
              ),
              backgroundColor: const Color(0xff161853),
              body: const ProjectScreen(),
            )
          ],
        ),
      ),
    );
  }
}
