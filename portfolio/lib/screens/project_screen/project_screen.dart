import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/provider/screenui_providers.dart';
import 'package:portfolio/screens/project_screen/project_detail_screen.dart';
import 'package:portfolio/screens/widgets/cardSectionDots.dart';

import '../../provider/project_provider.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final counter = ref.read(screenUiProvider.notifier);
      final projects = ref.watch(projectsProvider);
      return SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 24,
            ),
            Text('Software Development Projects',
                style: GoogleFonts.lora(
                    textStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 24))),
            const SizedBox(
              height: 24,
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.4,
                    maxWidth: MediaQuery.of(context).size.width),
                child: projects.when(
                  data: (data) => PageView.builder(
                    onPageChanged: (value) => {counter.changeValue(value)},
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) => Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProjectDetailsScreen(
                              project: data[index],
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(
                                    data[index].logoUrl,
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              flex: 10,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.6,
                                width: MediaQuery.of(context).size.width / 1.2,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Image.network(
                                    data[index].pictureUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  error: (err, stackTracea) => Text('Error: $err'),
                  loading: () => const CircularProgressIndicator(),
                )),
            projects.when(
              data: (data) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 18,
                  child: Align(
                    alignment: Alignment.center,
                    child: CardSectionDots(
                      dotNumber: ref.watch(screenUiProvider),
                      itemCount: projects.value!.length,
                    ),
                  ),
                ),
              ),
              error: (err, stackTracea) => Text('Error: $err'),
              loading: () => const CircularProgressIndicator(),
            )
          ],
        ),
      );
    });
  }
}
