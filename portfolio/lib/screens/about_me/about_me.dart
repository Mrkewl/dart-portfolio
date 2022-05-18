import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../provider/user_provider.dart';

class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final user = ref.watch(userProvider);
      return SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                user.when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('About Me',
                                style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 24))),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffEC255A)),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            content: Text(data.stack
                                                .replaceAll(',', '\n')),
                                          ));
                                },
                                child: const Text('My Stack')),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffFAEDF0)),
                                onPressed: () {
                                  launch(data.resume);
                                },
                                child: const Text(
                                  'My Resume',
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Text(
                          data.aboutMe,
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    );
                  },
                  error: (err, stackTracea) => Text('Error: $err'),
                  loading: () => const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
