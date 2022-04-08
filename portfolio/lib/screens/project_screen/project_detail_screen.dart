import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/project.dart';

class ProjectDetailsScreen extends StatelessWidget {
  const ProjectDetailsScreen({
    Key? key,
    required this.project,
  }) : super(key: key);
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff161853),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      project.logoUrl,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      project.pictureUrl,
                      scale: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Description',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              color: Color(0xffFAEDF0),
                              fontStyle: FontStyle.italic),
                        )),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(project.description,
                          textScaleFactor: 1.2,
                          style: GoogleFonts.lora(
                              color: const Color(0xffFAEDF0), fontSize: 16)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                          project.keyContribution
                              .replaceFirst('Key contribution:\n', '')
                              .split('\n')
                              .join('\n\n-'),
                          textScaleFactor: 1.2,
                          style: GoogleFonts.lora(
                              color: const Color(0xffFAEDF0), fontSize: 16)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Download Here',
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                            fontSize: 24,
                            color: Color(0xffFAEDF0),
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => launch(project.googleAppLinkUrl),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.asset('assets/googleplay.png')),
                        ),
                        GestureDetector(
                          onTap: () => launch(project.appleAppLinkUrl),
                          child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Image.asset('assets/appstore.png')),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      const Expanded(
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      const Expanded(
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          'Swipe Left To Exit',
                          style: GoogleFonts.lora(
                            fontStyle: FontStyle.italic,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
