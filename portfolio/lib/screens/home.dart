import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/screens/project_screen/project_screen.dart';

import '../provider/screenui_providers.dart';
import 'design_screen/design_screen.dart';
import 'introduction_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollPhysics scrollPhysics = const ScrollPhysics();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff161853),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          physics: scrollPhysics,
          onPageChanged: (index) {
            if (index == 1) {
              setState(() {
                scrollPhysics = const NeverScrollableScrollPhysics();
              });
            }
          },
          scrollDirection: Axis.vertical,
          children: [
            const IntroductionPage(),
            Consumer(builder: (context, ref, child) {
              final bottomNavigationcounterState =
                  ref.watch(bottomNavigationUiProvider.notifier);
              final bottomNavigationcounter =
                  ref.watch(bottomNavigationUiProvider);

              return Scaffold(
                  bottomNavigationBar: BottomNavigationBar(
                    backgroundColor: const Color(0xffFAEDF0),
                    selectedItemColor: const Color(0xff161853),
                    unselectedItemColor: Colors.grey.shade400,
                    currentIndex: bottomNavigationcounter,
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.abc), label: 'Projects'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.abc), label: 'Designs'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.abc), label: 'Projects'),
                    ],
                    onTap: (index) {
                      bottomNavigationcounterState.changeValue(index);
                    },
                  ),
                  backgroundColor: const Color(0xff161853),
                  body: bottomNavigationcounter == 0
                      ? const ProjectScreen()
                      : bottomNavigationcounter == 1
                          ? DesignScreen()
                          : Container());
            }),
          ],
        ),
      ),
    );
  }
}
